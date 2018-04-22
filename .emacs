;;default config
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(invert-face 'default)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 120 2))

(setq inhibit-splash-screen 't)

(setq org-src-fontify-natively t)
;;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(add-to-list 'load-path "~/.emacs.d/lisp")

;; (load-file "~/.emacs.d/scad-mode.el")
;;aus gruenden
;(require 'scad)

;; (load-file "~/.emacs.d/zeitgeist.el")
;(require 'zeitgeist)

;; use cua mode to edit muliple lines
(cua-mode 'on)
(setq-default cua-enable-cua-keys nil)

(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(load-file "~/.emacs.d/ruby-additional.el")
(require 'ruby-additional)
;(require 'ruby-electric)

;;add global key binding for magit-status
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x G") 'magit-blame-mode)

;; pretty annoying:
;(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru$" . ruby-mode))

(add-to-list 'auto-mode-alist '("Gruntfile$" . js-mode))

(add-hook 'ruby-mode-hook 'subword-mode)
(add-hook 'js-mode-hook 'subword-mode)

;; (setq-default ruby-deep-arglist nil)
;; (setq-default ruby-deep-indent-paren '())

;; coffee is awesome, but coffee-mode?
;(require 'coffee-mode)

(require 'greek)

(add-to-list 'load-path "~/.emacs.d/feature-mode")
;;aus gruenden
;(require 'feature-mode)

;; aus gruenden
;(require 'slim-mode)

(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

(setq js-indent-level 2)

;;my keysets
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-S-x C-c") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-q") 'save-buffers-kill-terminal)

(global-unset-key (kbd "C-z"))
;;-------------------------------------------------------------

;;haml is also awesome but not now
;(require 'haml-mode)
;(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;;add package-archive melpa-stable for magit
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(set 'electric-indent-mode '())

;;puppet-master?
;(require 'puppet-mode)
;(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;php auto complete
(package-initialize)
(unless (package-installed-p 'ac-php )
 (package-refresh-contents)
 (package-install 'ac-php )
 )
(require 'cl)
(require 'php-mode)
(add-hook 'php-mode-hook '(lambda ()
                           (auto-complete-mode t)
                           (require 'ac-php)
                           (setq ac-sources  '(ac-source-php ) )
                           (yas-global-mode 1)

                           (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                           (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
                           ))
;;-----------------------------------------------------------------------------------------------------------

;;yasnippet is also awesome
(require 'yasnippet)
(yas-reload-all)
(add-hook 'js-mode-hook #'yas-minor-mode)

(add-hook 'java-mode-hook (lambda ()
                           (setq c-basic-offset 2)))

;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
