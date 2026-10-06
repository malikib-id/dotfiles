;; 1. Mengembalikan format standar yang jujur, rapi, dan otomatis (Human-Readable)
(setq dired-listing-switches "-lh --group-directories-first")

;; 2. Mengubah format jam agar selalu konsisten dan rapi
(setq directory-listing-before-filename-regexp
      (regexp-quote " "))

(provide 'modul-dired)
