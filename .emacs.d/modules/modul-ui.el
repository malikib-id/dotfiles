;; ======================================================
;; TAMPILAN EMACS 
;; ======================================================

;; ========== THEME & FONT ==========

(setq inhibit-startup-screen t)
(load-theme 'modus-vivendi t)

;; Theme dark yang ramah mata
(load-theme 'modus-vivendi t)  ;; Theme built-in high contrast, atau:
;; (load-theme 'dracula t)     ;; Jika install dari MELPA

;; FONT
(set-frame-font "Fira Code" nil t)

;; Pengaturan detail face default agar konsisten
(set-face-attribute 'default nil 
                    :family "Fira Code" 
                    :height 130 
                    :weight 'regular)

(setq-default line-spacing 2)

;; Cadangan Font
;; Comic Mono-12
;; JetBrains Mono-12
;; Fira Code

;; EWW DARK MODE - SINGKAT PASTI BEKERJA
(setq eww-data-color-scheme 'dark)
(setq eww-disable-colorize t)


;; ========== UI ==========
;; biar gak ada tombol
(menu-bar-mode -1)     ; Menghilangkan menu teks di bagian atas
(tool-bar-mode -1)     ; Menghilangkan ikon tombol (buka, simpan, dll)
(scroll-bar-mode -1)   ; Menghilangkan batang gulir di samping kanan

;; biar makin ringan (katanya)
(setq gc-cons-threshold 20000000)

;; Line numbers untuk Emacs modern
(global-display-line-numbers-mode t)

;; Highlight matching parentheses
(show-paren-mode t)

(setq mode-line-position " %l:%c ")  ;; line:col tanpa -----
(setq mode-line-buffer-identification " %b ")  ;; buffer name tanpa -----


;; ========= WARNING BRACKET SEDERHANA =========
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "blue" :foreground "white" :bold t))))
 '(show-paren-mismatch ((t (:background "red" :foreground "white" :bold t)))))

;; Always show matching paren
(setq show-paren-when-point-inside-paren t)
(setq show-paren-when-point-in-periphery t)

;; Delay 0 (langsung muncul)
(setq show-paren-delay 0)
(display-time-mode 1)
;; (setq show-paren-context-when-offscreen t)
(setq blink-matching-paren 'show) ;; Menampilkan pasangan kurung offscreen di minibuffer

;; Line spacing (beri jarak antar baris)
(setq-default line-spacing 2)

;; Word wrap yang SMART untuk coding
(global-visual-line-mode t)  ;; atau (global-display-fill-column-indicator-mode t)

;; Column guide (garis batas vertikal)
(setq-default fill-column 80)  ;; atau 100
(global-display-fill-column-indicator-mode t)  ;; tampilkan garis di kolom ke-80

(use-package diminish
  :ensure t
  :init
  ;; Menyembunyikan minor-modes bawaan Emacs secara global
  (diminish 'visual-line-mode)
  (diminish 'auto-revert-mode " ↻") ; Mengubah 'ARev' jadi ikon panah kecil yang rapi
  (diminish 'eldoc-mode))

;; 2. Membersihkan minor-modes pihak ketiga (Company, Eglot, dll.) setelah mereka dimuat
(with-eval-after-load 'company
  (diminish 'company-mode))

(with-eval-after-load 'eglot
  
  ;; Menyembunyikan teks detail eglot, atau jika ingin tetap tahu eglot aktif,
  ;; Anda bisa mengganti nil dengan " ⚡" agar hanya muncul satu ikon kecil yang keren
  (setq eglot-menu-string nil))

;; Fungsi tunggal untuk mengatur warna biru gelap pilihan Anda
(defun my-set-custom-colors (frame)
  (with-selected-frame frame
    (set-face-attribute 'default frame :background "#05050a" :foreground "#e4e7ed")))
;; cadangan warna
;; Biru
;; #0b0f19
;; #090d16
;; #181820

;; Hitam
;; #101016
;; #05050a <-

;; Jalankan fungsi di atas secara otomatis untuk frame aktif DAN frame emacsclient baru
(mapc #'my-set-custom-colors (frame-list))
(add-hook 'after-make-frame-functions #'my-set-custom-colors)



(provide 'modul-ui)
