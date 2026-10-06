;; ========== VTERM ==========
(use-package vterm
  :ensure t
  :config
  
  ;; Hapus pintasan f2 & f3 bawaan jika ada bentrokan
  (define-key vterm-mode-map (kbd "<f2>") nil)
  (define-key vterm-mode-map (kbd "<f3>") nil)

  ;; Pintasan Copas di Terminal Aktif
  (define-key vterm-mode-map (kbd "C-v") 'vterm-yank)      ; Paste teks ke terminal
  (define-key vterm-mode-map (kbd "M-w") 'vterm-copy-mode) ; Masuk ke mode pilih/salin teks

  ;; OTIMATISASI MODE SALIN (COPY MODE) YANG SUDAH DIPERBAIKI
  ;; Saat Anda berada di dalam Vterm Copy Mode dan menekan M-w:
  ;; Teks akan tersalin, lalu vterm akan OTOMATIS menutup mode salin dan Anda bisa mengetik lagi.
  (with-eval-after-load 'vterm
    (define-key vterm-copy-mode-map (kbd "M-w")
                (lambda ()
                  (interactive)
                  (call-interactively 'kill-ring-save) ; Menyalin teks yang sedang diblok
                  (vterm-copy-mode -1))))              ; Otomatis keluar dari mode salin dan kembali aktif
  
  ;; TOMBOL BATAL: Tekan 'q' atau 'ESC' untuk cancel mode copy tanpa menyalin apa pun
    (define-key vterm-copy-mode-map (kbd "q") (lambda () (interactive) (vterm-copy-mode -1)))
  
  :hook
  ;; MATIKAN ANGKA BARIS DI KIRI
  (vterm-mode . (lambda ()
                  (display-line-numbers-mode -1))))

;; FUNGSI KUSTOM TERMINAL SAMPING 
(defun buka-terminal-samping ()
  "Membuka vterm di sebelah kanan dengan lebar 40% layar."
  (interactive)
  (let ((vterm-buffer (get-buffer "*vterm*")))
    (if (and vterm-buffer (get-buffer-window vterm-buffer))
        ;; Jika vterm sudah terbuka di layar, sembunyikan (tutup jendelanya)
        (delete-window (get-buffer-window vterm-buffer))
      ;; Jika belum ada, belah layar ke kanan dan jalankan vterm
      (let ((window (split-window-right (truncate (* (window-total-width) 0.6)))))
        (select-window window)
        (vterm)))))

;; PETAKAN KOMBUNASI TOMBOL
(global-set-key (kbd "<f3>") 'buka-terminal-samping)

(provide 'modul-terminal)
