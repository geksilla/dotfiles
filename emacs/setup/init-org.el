(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (plantuml .t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/scripts/plantuml.jar"))
(provide 'init-org)
