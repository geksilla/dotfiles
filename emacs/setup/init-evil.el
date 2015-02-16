(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-leader)

(setq evil-want-C-u-scroll t)
(require 'evil-leader)
(global-evil-leader-mode t)
(require 'evil-surround)
(global-evil-surround-mode t)
(require 'evil)
(evil-mode 1)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "k" 'kill-buffer
  "g s" 'magit-status
  "l s" 'helm-buffers-list
  "s" 'save-buffer
  "b n" 'next-buffer
  "b p" 'previous-buffer)

(provide 'init-evil)
