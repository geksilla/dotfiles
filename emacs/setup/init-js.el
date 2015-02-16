(require-package 'js2-mode)
(require-package 'js2-refactor)
(require-package 'js-doc)
(require-package 'coffee-mode)
(require-package 'ac-js2)

(require 'js2-mode)
(require 'ac-js2)
(require 'js2-refactor)

(setq-default js2-global-externs '("module" "require" "sinon" "before" "after" "beforeEach" "afterEach" "describe" "it" "expect"))
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t)
(setq-default js2-indent-switch-body t)
(setq-default js-indent-level tab-width
      indent-tabs-mode nil
      c-basic-offset tab-width
      js2-basic-offset tab-width)

(defun my--js2-mode-hook ()
  (require 'js)
  (c-toggle-auto-state nil)
  (c-toggle-hungry-state t)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (js2r-add-keybindings-with-prefix "C-c C-m")
  (js2-imenu-extras-mode +1)
  (define-key js2-mode-map (kbd "C-c j d") 'js-doc-insert-function-doc)
  (smartparens-mode)
  (sp-use-paredit-bindings)
  (flycheck-mode t))

(eval-after-load 'js2-mode
  '(progn
     (add-hook 'js2-mode-hook 'my--js2-mode-hook))) 

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(defun my--company-js-hook () 
  (add-to-list 'company-backends 'ac-js2-company)
  (add-to-list 'company-dabbrev-code-modes 'js2-mode)
  (add-to-list 'company-semantic-modes 'js2-mode))

(add-hook 'company-mode-hook 'my--company-js-hook)

(eval-after-load 'auto-complete
  (eval-after-load 'tern
    '(progn
       (add-to-list 'exec-path "~/.nvm/v0.10.33/bin")
       (require 'tern-auto-complete)
       (tern-ac-setup))))

;; coffee-mode
(require 'coffee-mode)
(setq whitespace-action '(auto-cleanup))
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
(setq coffee-indent-tabs-mode t)

(provide 'init-js)
