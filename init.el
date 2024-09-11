(add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))

(use-package borg
  :config
  (borg-initialize))

(use-package agda-input
  :hook (text-mode . (lambda () (set-input-method "Agda"))))

(use-package emacs
  :config
  (setopt inhibit-startup-screen t)
  (setopt initial-scratch-message nil)
  (setopt cursor-type 'bar)
  (setopt make-backup-files nil)
  (auto-save-mode -1)
  (auto-save-visited-mode 1)
  (menu-bar-mode -1)
  (tool-bar-mode -1))
