(add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))

(use-package borg
  :config
  (borg-initialize))

(use-package agda-input
  :hook (text-mode . (lambda () (set-input-method "Agda"))))

(use-package avy
  :bind
  (("M-j" . avy-goto-char-timer)
   :map isearch-mode-map
   ("M-j" . avy-isearch))
  :config
  (defun avy-action-embark (pt)
    (unwind-protect
      (save-excursion
	(goto-char pt)
	(embark-act))
    (select-window
     (cdr (ring-ref avy-ring 0))))
  t)

  (setf (alist-get ?. avy-dispatch-alist) 'avy-action-embark))

(use-package company
  :hook (prog-mode . company-mode))

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

(use-package embark)

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package lsp-haskell
  :hook (haskell-mode . lsp-deferred))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp-deferred)

(use-package lsp-ui)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package wakib-keys
  :config
  (wakib-keys 1)
  (add-hook 'after-change-major-mode-hook 'wakib-update-major-mode-map)

  (define-key wakib-keys-overriding-map (kbd "C-q") nil)
  (define-key wakib-keys-overriding-map (kbd "M-j") nil)
  (define-key wakib-keys-overriding-map (kbd "M-l") nil)
  (define-key wakib-keys-overriding-map (kbd "M-i") nil)
  (define-key wakib-keys-overriding-map (kbd "M-k") nil)
  (define-key wakib-keys-overriding-map (kbd "M-u") nil)
  (define-key wakib-keys-overriding-map (kbd "M-o") nil))
