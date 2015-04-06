;; maximize on startup
(require-package 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
(windmove-default-keybindings)
(global-linum-mode t)
(global-auto-revert-mode t)
(defvar js-enable-tern nil
  "Enable tern mode for js files")
(setq js-enable-tern t)
(setq-default tab-width 2)
(setq-default fill-column 120)
(setq-default js-indent-level tab-width)
(setq create-lockfiles nil)
(setq ediff-split-window-function 'split-window-horizontally)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq mode-require-final-newline nil)
;; set env path
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))
(provide 'init-defaults)
