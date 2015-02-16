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
    projectile
    helm
    helm-projectile
    helm-ag
    ace-jump-mode
    move-text
    flycheck
    jade-mode
    handlebars-mode
    handlebars-sgml-mode
    skewer-mode
    ag
    multiple-cursors
    yasnippet
    visual-regexp
    git-gutter
    stylus-mode
    cider
    ac-cider
    company
    emmet-mode))

(dolist (package package-list)
    (unless (package-installed-p package)
          (package-install package)))

(provide 'init-packages)
