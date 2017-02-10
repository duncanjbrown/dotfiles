(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package better-defaults
             :ensure t)
(use-package projectile
  :ensure t)

(setq evil-want-C-i-jump nil)

(use-package evil
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package paredit
  :ensure t)

(use-package cider
  :ensure t)

(use-package helm
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(load-theme 'zenburn t)
;; Install code completion and enable it globally
(use-package company
  :ensure t
  :config
  (global-company-mode))

(add-hook 'clojure-mode-hook #'paredit-mode)

(require 'evil)
(evil-mode t)

(require 'helm-config)

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO" "REVIEW" "DONE")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/projects/clojure/command-line-args/foo.org")))
 '(package-selected-packages
   (quote
    (helm zenburn-theme company use-package cider clojure-mode projectile better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
