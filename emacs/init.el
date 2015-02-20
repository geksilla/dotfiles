(add-to-list 'load-path (expand-file-name "setup" user-emacs-directory))

(require 'init-packages)
(require 'init-defaults)

(require 'init-theme)
(require 'init-evil)
(require 'init-company)
(require 'init-js)
(require 'init-css)
(require 'init-keymap)

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

;; ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; handlebars
(require 'handlebars-sgml-mode)
(require 'handlebars-mode)
(handlebars-use-mode 'global)
(add-hook 'handlebars-mode-hook 'html-mode)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

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
(smartparens-global-mode t)

;; js2-mode configs

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
 '(package-selected-packages
   (quote
    (visual-regexp stylus-mode starter-kit-lisp smartparens scss-mode sass-mode powerline move-text maxframe markdown-mode less-css-mode js2-refactor js-doc jade-mode helm-projectile helm-ag handlebars-sgml-mode handlebars-mode git-gutter flycheck evil-surround evil-leader emmet-mode company-tern color-theme-sanityinc-tomorrow coffee-mode ag ace-jump-mode ac-js2 ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
