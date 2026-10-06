;; 1. OPTIMASI PERFORMA CORE

(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 20000000)))
(setq read-process-output-max (* 1024 1024))
(add-to-list 'exec-path "/home/malikib/.npm-global/bin")



(provide 'modul-perform)
