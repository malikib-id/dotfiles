;; ========== BACKUP ==========

;; 1. Definisikan jalur folder cadangan
(defvar my-backup-dir "~/.emacs.d/backups/")
(defvar my-auto-save-dir "~/.emacs.d/auto-save/")

;; 🔄 OTOMATISASI: Buat folder langsung jika belum ada di komputer
(unless (file-exists-p my-backup-dir)
  (make-directory my-backup-dir t))
(unless (file-exists-p my-auto-save-dir)
  (make-directory my-auto-save-dir t))

;; 2. Daftarkan folder ke sistem Emacs
(setq backup-directory-alist `(("." . ,my-backup-dir)))
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-dir t)))

;; 3. Aktifkan fitur backup & auto-save
(setq make-backup-files t)    ; Aktifkan backup otomatis
(setq auto-save-default t)    ; Aktifkan auto-save otomatis

;; 4. Atur sistem nomor versi agar lebih pintar
(setq version-control t)      ; Pakai sistem nomor versi (file.txt.~1~)
(setq kept-old-versions 2)    ; Simpan 2 versi cadangan paling awal
(setq kept-new-versions 6)    ; Simpan 6 versi cadangan terbaru
(setq delete-old-versions t)  ; Otomatis hapus versi tengah yang tidak penting

;; ;; Disable backup files
;; (setq make-backup-files nil) ; Tidak buat backup file
;; (setq auto-save-default nil) ; Tidak buat auto-save file (#file#)


(provide 'modul-backup)
