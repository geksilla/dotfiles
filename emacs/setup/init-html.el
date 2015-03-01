(require-package 'slim-mode)
(require-package 'handlebars-mode)
(require-package 'handlebars-sgml-mode)
(require-package 'emmet-mode)
;; slim templates
(require 'slim-mode)

;; handlebars
(require 'handlebars-sgml-mode)
(require 'handlebars-mode)
(handlebars-use-mode 'global)
(add-hook 'handlebars-mode-hook 'html-mode)

;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(provide 'init-html)