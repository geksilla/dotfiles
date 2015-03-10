(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-leader)

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
    (or column
        (unless selective-display
          (1+ (current-column))))))

(defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))

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
  "g b" 'magit-blame-mode
  "l s" 'helm-buffers-list
  "s" 'save-buffer
  "/" 'toggle-hiding)


(define-key evil-insert-state-map "\C-j" 'emmet-expand-line)
(provide 'init-evil)
