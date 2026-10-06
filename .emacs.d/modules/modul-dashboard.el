;; 1. Matikan layar startup bawaan Emacs
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-screen t)

;; 2. Tentukan daftar folder khusus yang ingin Anda tampilkan
(defvar my-favorite-folders
  '(("~/qa-automation/Jinom" . "Jinom")
    ("~/qa-automation/pos-saas-automation-testing-ts"  . "Flogika")
    ("~/Hardware"  . "Hardware")
    ("~/Documents/Docs/"  . "Docs")
    )
  "Daftar aliansi folder (Jalur . Nama Tampilan) untuk dashboard.")

;; 3. Buat fungsi untuk membangun halaman utama kustom
(defun my-custom-dashboard ()
  "Membuat buffer dashboard kustom dengan teks besar dan folder Dired."
  (let ((buf (get-buffer-create "*Dashboard*"))
        (custom-map (make-sparse-keymap)) ;; Buat peta tombol mandiri
        first-button-pos)
    
    ;; Atur peta tombol mandiri agar tidak merusak Dired
    (set-keymap-parent custom-map special-mode-map)
    (define-key custom-map (kbd "<down>") 'forward-button)
    (define-key custom-map (kbd "n")      'forward-button)
    (define-key custom-map (kbd "<up>")   'backward-button)
    (define-key custom-map (kbd "p")      'backward-button)
    
    (with-current-buffer buf
      (special-mode)
      (use-local-map custom-map)
      
      ;; --- Sisipkan 3 baris pengatur tampilan ini ---
      (when (fboundp 'display-line-numbers-mode) 
        (display-line-numbers-mode -1)) ;; Menyembunyikan nomor baris khusus di buffer ini
      (face-remap-add-relative 'default :height 1.2) ;; Memperbesar ukuran teks sebesar 20%
      ;; ----------------------------------------------
      
      (let ((inhibit-read-only t))
        (erase-buffer)
        
                ;; Tulisan Selamat Datang Besar dengan Warna Kustom Sendiri
        (insert "\n")
        (insert (propertize "  ╭──────────────────────────────────────────────────╮\n" 'face '(:foreground "#61afef"))) 
        (insert (propertize "  │                                                  │\n" 'face '(:foreground "#61afef")))
        (insert (propertize "  │             WELCOME BACK, MALIKIB!               │\n" 'face '(:foreground "#61afef" :weight bold)))
        (insert (propertize "  │                                                  │\n" 'face '(:foreground "#61afef")))
        (insert (propertize "  ╰──────────────────────────────────────────────────╯\n" 'face '(:foreground "#61afef")))
        (insert "\n\n")

        ;; Judul bagian folder
        (insert (propertize "  [ Your Favorit Folder ]\n\n" 'face 'font-lock-keyword-face))
        
        ;; Loop untuk memasukkan setiap folder sebagai tombol interaktif
        (dolist (folder my-favorite-folders)
          (let ((path (car folder))
                (name (cdr folder)))
            (insert "    • ")

            (unless first-button-pos
              (setq first-button-pos (point)))
            
            ;; Membuat teks menjadi tombol yang memicu Dired saat ditekan/diklik
            (insert-button (format "%-2s (%s)" name path)
                           'action (lambda (btn) (dired (button-get btn 'path)))
                           'path path
                           'follow-link t)
            (insert "\n\n")))
        
        (insert (propertize "  -----------------------------------------\n" 'face 'font-lock-comment-face))
        (insert "  Press [Tab] to switch folder, [Enter] to Open.\n")
        
        (when first-button-pos
          (goto-char first-button-pos))))
    ;; Kembalikan buffer agar diakui oleh initial-buffer-choice
    buf))

;; 4. Atur Emacs agar selalu membuka fungsi ini saat startup
(setq initial-buffer-choice (lambda () (my-custom-dashboard)))

(add-hook 'emacs-startup-hook
          (lambda ()
            ;; Memberi warna hijau tebal pada pesan di Echo Area bawah
            (message "%s" (propertize "Welcome Malikib!, Ready for Work?" 
                                      'face '(:foreground "#61afef" :weight bold)))))


(provide 'modul-dashboard)
