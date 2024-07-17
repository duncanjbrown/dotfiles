# Depends on the git plugin for work_in_progress()

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

stopped_jobs_status() {
  local stopped="$(jobs | cut -d ' ' -f 6 | tr '\n' ' ')"
  if [ -n "$stopped" ]; then
    echo "$stopped"
  fi
}

aws_vault_status() {
  local vault="$(printenv AWS_VAULT)"
  if [ -n "$vault" ]; then
    echo "$vault "
  fi
}

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

RPS1='$(git_custom_status) $EPS1'

PROMPT='%{$fg[red]%}$(aws_vault_status)%{$fg[cyan]%}$(stopped_jobs_status)%~% %(?.%{$fg[green]%}.%{$fg[red]%}) ::%{$reset_color%} '
