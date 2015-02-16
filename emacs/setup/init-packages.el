(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(defun require-package (package &optional min-version no-refresh)
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)
(require-package 'starter-kit)
(require-package 'starter-kit-lisp)

(defvar package-list 
  '(powerline
    markdown-mode
    smartparens
    auto-complete
    projectile
    helm
    helm-projectile
    helm-ag
    ace-jump-mode
    move-text
    zenburn-theme
    color-theme-sanityinc-tomorrow
    flycheck
    jade-mode
    js2-mode
    js2-refactor
    js-doc
    coffee-mode
    handlebars-mode
    handlebars-sgml-mode
    skewer-mode
    ac-js2
    ag
    multiple-cursors
    tern
    tern-auto-complete
    yasnippet
    visual-regexp
    git-gutter
    stylus-mode
    cider
    ac-cider
    company
    emmet-mode))
(provide 'init-packages)
