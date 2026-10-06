;; ========== CONFIG MAGIT (SIDE WINDOW 40% - FORCED RIGHT) ==========
(use-package magit
  :ensure t
  :config
  ;; 1. BUAT FUNGSI PEMBAJAK DISPLAY (Memaksa Magit ke Kanan & Ukuran Kaku)
  (defun my-magit-display-buffer (buffer)
    "Memaksa buffer status Magit terbuka di kanan sebesar 40% tanpa bisa diubah."
    (if (with-current-buffer buffer (derived-mode-p 'magit-status-mode))
        ;; Jika yang dibuka adalah status Magit, paksa masuk ke side-window kanan
        (let ((win (display-buffer-in-side-window
                    buffer
                    '((side . right)
                      (window-width . 0.4)
                      (dedicated . t)
                      (window-parameters . ((no-delete-other-windows . t)
                                            (no-other-window . nil)))
                      (window-size-fixed . t)))))
          (select-window win)
          win)
      ;; Untuk buffer Magit pembantu lainnya (seperti log/diff), biarkan pakai bawaan
      (magit-display-buffer-traditional buffer)))

  ;; 2. Aktifkan fungsi pembajak di atas ke dalam sistem inti Magit
  (setq magit-display-buffer-function #'my-magit-display-buffer)
  
  :bind
  ;; 3. Ikat ke pintasan universal bawaan Magit
  (("C-x g" . magit-status)))

;; 4. Kunci pengaman global sistem window Emacs
(setq window-sides-vertical t)
(setq window-min-width 1)
(setq window-min-height 1)

(provide 'modul-git)
