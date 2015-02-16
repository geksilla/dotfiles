(require-package 'company)
(require 'company)

(setq company-auto-complete t)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-limit 15)
(setq company-global-modes t)
(setq company-dabbrev-ignore-case nil)
(setq company-dabbrev-downcase nil)

(global-company-mode 1)

(provide 'init-company)
