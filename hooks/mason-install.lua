-- Install any LSP servers from mason-lspconfig's ensure_installed that are
-- missing, and wait for them to finish. mason-lspconfig skips ensure_installed
-- in headless mode, and in a normal session the installs run in the background
-- and get aborted if you quit early, so post-up does them here instead.
--
-- Usage: nvim --headless -c "luafile hooks/mason-install.lua"

local function log(msg)
  io.stdout:write(msg .. "\n")
end

local function finish(code)
  vim.cmd(code == 0 and "qall!" or "cquit! " .. code)
end

-- Loading mason-lspconfig runs its lazy.nvim config, i.e. require('lsp').
require("lazy").load({ plugins = { "mason-lspconfig.nvim" } })

local registry = require("mason-registry")
local Package = require("mason-core.package")
local servers = require("mason-lspconfig.settings").current.ensure_installed
local to_package = require("mason-lspconfig").get_mappings().lspconfig_to_package

local refreshed = false
registry.refresh(function() refreshed = true end)
if not vim.wait(120000, function() return refreshed end, 100) then
  log("Timed out refreshing the Mason registry")
  return finish(1)
end

local pending, failed = 0, {}

for _, id in ipairs(servers) do
  local server, version = Package.Parse(id)
  local name = to_package[server]
  local ok, pkg = pcall(registry.get_package, name or "")
  if not name or not ok then
    log("Unknown server: " .. server)
    table.insert(failed, server)
  elseif not pkg:is_installed() and not pkg:is_installing() then
    log("Installing " .. name)
    pending = pending + 1
    pkg:install({ version = version }, function(success, err)
      if not success then
        log("Failed to install " .. name .. ": " .. tostring(err))
        table.insert(failed, name)
      end
      pending = pending - 1
    end)
  end
end

if not vim.wait(1800000, function() return pending == 0 end, 200) then
  log("Timed out waiting for Mason installs")
  return finish(1)
end

if #failed > 0 then
  return finish(1)
end
finish(0)
