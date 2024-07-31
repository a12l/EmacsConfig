(defconst my-pkgs-dir (expand-file-name "./packages" (file-name-directory load-file-name)))

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
