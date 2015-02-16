(windmove-default-keybindings)
(global-linum-mode t)
(global-auto-revert-mode t)
(setq-default tab-width 2)
(setq-default fill-column 120)
(setq-default js-indent-level tab-width)
(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; set env path
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))

(provide 'init-defaults)
