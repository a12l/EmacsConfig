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

(use-package wakib-keys
  :bind
  (:map wakib-keys-overriding-map
	("C-q" . nil))
  :config
  (wakib-keys 1))
