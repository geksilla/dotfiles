(add-to-list 'load-path (expand-file-name "setup" user-emacs-directory))

(require 'init-packages)
(require 'init-defaults)
(require 'init-evil)

;; projectile
(require 'helm-projectile)
(helm-projectile-on)
(projectile-global-mode)


;; powerline
(require 'powerline)
(powerline-default-theme)

;; git-gutter
(global-git-gutter-mode t)
(git-gutter:linum-setup)

;; key bindings 
(define-key global-map (kbd "M-P") 'move-text-up)
(define-key global-map (kbd "M-N") 'move-text-down)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)
(define-key global-map (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x v u") 'git-gutter:update-all-windows)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; vagrant-tramp
(eval-after-load 'tramp
  '(vagrant-tramp-enable))

;; ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; stylus
(require 'stylus-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(defun stylus-hook ()
  (auto-complete-mode)
  (smartparens-mode))
(add-hook 'stylus-mode-hook 'stylus-hook)

;; handlebars
(require 'handlebars-sgml-mode)
(require 'handlebars-mode)
(handlebars-use-mode 'global)
(add-hook 'handlebars-mode-hook 'html-mode)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete config
(require 'auto-complete-config)
(ac-config-default)

;; CIDER
(require 'cider)
(require 'clojure-mode)
(require 'ac-cider)
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
;; (setq cider-lein-command "/usr/local/bin/lein")
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'cider-mode))
(eval-after-load 'clojure-mode
  '(progn
     (defun my-clojure-hook ()
       (cider-mode)
       (company-mode t)
       (cider-turn-on-eldoc-mode))
     
     (add-hook 'clojure-mode-hook 'my-clojure-hook)))
(add-hook 'cider-repl-mode-hook 'company-mode)


;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;; smartparens
(require 'smartparens-config)

;; js2-mode configs
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

(setq-default js2-global-externs '("module" "require" "sinon" "before" "after" "beforeEach" "afterEach" "describe" "it" "expect"))
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t)
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)
 
      (save-excursion
 
        (back-to-indentation)
        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation ( 4 indentation))))
 
      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))
(defun my-js2-mode-hook ()
  (require 'js)
  (setq js-indent-level tab-width
        indent-tabs-mode nil
        c-basic-offset tab-width)
  (c-toggle-auto-state nil)
  (c-toggle-hungry-state t)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map (kbd "C-j") 'newline-and-indent)
  (define-key js2-mode-map (kbd "C-m") 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map (kbd "C-c j d") 'js-doc-insert-function-doc)
  (setq ac-js2-evaluate-calls t)
  (ac-js2-mode)
  (smartparens-mode)
  (sp-use-paredit-bindings)
  (flycheck-mode t))

(eval-after-load 'js2-mode
  '(progn
     (add-hook 'js2-mode-hook 'my-js2-mode-hook))) 

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))


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
(eval-after-load 'coffee-mode
  '(progn
     (auto-complete-mode t)))

;;markdown-mode
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode nil)
 '(coffee-tab-width tab-width)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(emmet-indentation tab-width)
 '(fci-rule-color "#383838")
 '(indent-tabs-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(show-paren-mode t)
 '(standard-indent tab-width)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
