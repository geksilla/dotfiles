(require-package 'project-explorer)

(require 'project-explorer)
(setq pe/omit-regex (concat pe/omit-regex "\\|^node_modules$\\|^bower_components$"))

(provide 'init-project-explorer)
