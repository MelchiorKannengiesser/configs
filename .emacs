;;default config
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
;;(invert-face 'default)
(setq inhibit-splash-screen 't)
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-q") 'save-buffers-kill-terminal)

;;Tabs Are Evil
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 120 2))

;;add package-archive melpa-stable for magit
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;;add global key binding for magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; use cua mode to edit muliple lines
(cua-mode 'on)
(setq-default cua-enable-cua-keys nil)
