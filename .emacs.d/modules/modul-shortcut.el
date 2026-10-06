;; ========== SHORTCUT ==========

;; 4. AUTO COMPLETE BUILT-IN (gak perlu install)
(setq tab-always-indent 'complete)  ; Tab untuk complete
(icomplete-mode t)                  ; Completion sederhana

;; Auto complete tanda kutip, kurung, dll
(electric-pair-mode t)  ; Ketik "会自动 muncul "
(setq electric-pair-pairs '(
    (?\" . ?\")
    (?\' . ?\')
    (?\( . ?\))
    (?\[ . ?\])
    (?\{ . ?\})
))

;; Undo/Redo yang intuitif
;; (global-set-key (kbd "C-z") 'undo)      ; Ctrl+Z untuk undo
;; (global-set-key (kbd "C-S-z") 'redo)    ; Ctrl+Shift+Z untuk redo

(use-package undo-fu
  :ensure t
  :config
  ;; Petakan Ctrl-Z untuk Undo yang normal
  (global-set-key (kbd "C-z") 'undo-fu-only-undo)
  ;; Petakan Ctrl-Shift-Z untuk Redo yang normal
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))


;; Copy, cut, paste dengan keyboard
(global-set-key (kbd "C-c") 'kill-ring-save)     ; Copy
(global-set-key (kbd "C-w") 'kill-region)        ; Cut
(global-set-key (kbd "C-v") 'yank)               ; Paste


;; Fungsi penghapusan kata murni (Zap) tanpa menyentuh clipboard atau kill-ring sama sekali
(defun my/pure-delete-word-backward ()
  "Hapus satu kata ke belakang secara permanen tanpa mengotori kill-ring atau clipboard."
  (interactive)
  (let ((p (point)))
    (save-excursion
      (backward-word 1)
      (delete-region (point) p))))

;; Bikin shortcut baru: Ctrl + Backspace
(global-set-key (kbd "C-<backspace>") 'my/pure-delete-word-backward)

;; Jika kamu tetap ingin mencoba tombol Shift + Backspace, pasang juga di sini:
(global-set-key (kbd "S-<backspace>") 'my/pure-delete-word-backward)

;; Paste dari clipboard Termux
(defun paste-from-termux ()
  "Paste from Termux clipboard."
  (interactive)
(insert (shell-command-to-string "termux-clipboard-get")))
(global-set-key (kbd "C-S-v") 'paste-from-termux)

;;tambah opsi untuk switch buffer
(global-set-key (kbd "<f2>") 'switch-to-buffer)

;; Shortcut menjadikan line sebagai comment-line
(global-set-key (kbd "C-/") 'comment-line)

;; Mengaktifkan navigasi pindah layar dengan Shift + Panah
(windmove-default-keybindings)

;; Zap Up To Char (Hapus sampai menyentuh huruf target, hurufnya TIDAK ikut terhapus)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; Zap Mundur (Hapus ke arah KIRI/Belakang sampai menyentuh huruf target)
(global-set-key (kbd "M-Z") ; Ini Alt + Shift + Z
                (lambda (char)
                  (interactive "cZap backward to char: ")
                  (zap-up-to-char -1 char)))



(global-set-key (kbd "C-<f12>") 'restart-emacs)
(provide 'modul-shortcut)
