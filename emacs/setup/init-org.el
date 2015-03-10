(require-package 'org-bullets)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (plantuml .t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/scripts/plantuml.jar"))
(add-hook 'org-mode-hook 'org-bullets-mode)

(provide 'init-org)
