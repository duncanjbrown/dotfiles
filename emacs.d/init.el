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
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO" "REVIEW" "DONE")))

;; OrgMobile configuration https://mobileorg.github.io/
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; Location of all files to be synced to MobileOrg https://groups.google.com/forum/#!topic/mobileorg-android/TcoseKmXShc
(setq org-agenda-files '("~/org"))
;; Don't smush PROPERTIES blocks into all the org files http://orgmode.org/manual/Pushing-to-MobileOrg.html
(setq org-mobile-force-id-on-agenda-items nil)

;; auto-sync with mobile org http://stackoverflow.com/questions/8432108/how-to-automatically-do-org-mobile-push-org-mobile-pull-in-emacs
(add-hook 'after-init-hook 'org-mobile-pull)
(add-hook 'kill-emacs-hook 'org-mobile-push)

(setq column-number-mode t)

(setq inhibit-splash-screen t) ;; don't show the splash screen
(setq vc-follow-symlinks t) ;; follow symlinks to version-controlled files

(set-frame-font "SauceCodePro Nerd Font")
(set-default-font "SauceCodePro Nerd Font")
(set-face-attribute 'default nil :font "SauceCodePro Nerd Font" :height 130)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm zenburn-theme company use-package cider clojure-mode projectile better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )