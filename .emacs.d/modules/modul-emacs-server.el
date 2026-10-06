;; 1. Aktifkan fitur Pixel Scroll (Hanya bekerja di mode GUI)
;; Ini membuat scroll terasa sehalus VS Code atau browser modern
(pixel-scroll-precision-mode 1)

;; 2. Scroll Layar, Bukan Kursor!
;; Menjaga kursor tetap diam di posisinya saat layar di-scroll ke atas/bawah
(setq scroll-preserve-screen-position t)

;; 3. Scroll Agresif (Smooth Scrolling)
;; Mencegah layar "lompat-lompat" drastis saat kursor menyentuh batas atas/bawah
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; 4. Aktifkan Dukungan Mouse di Mode Terminal (-nw)
;; Agar saat Anda buka Emacs Client di Alacritty/Termux, mouse/trackpad tetap bisa dipakai scroll
(xterm-mouse-mode 1)
(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

;; Memetakan sinyal escape terminal agar terbaca sebagai Backspace di Emacs
(define-key local-function-key-map (kbd "C-<backspace>") [?\C-?])

;; Mengikat tombol tersebut ke fungsi hapus kata ke belakang
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)

;; Trik Cadangan: Di terminal, Ctrl+Backspace sering terbaca sebagai M-DEL (Alt+Backspace)
(global-set-key (kbd "M-<backspace>") 'backward-kill-word)


;; Sinkronisasi Clipboard Emacs Terminal dengan System Clipboard
(unless (display-graphic-p)
  (setq x-select-enable-clipboard t)
  
  ;; Fungsi untuk Copy dari Emacs ke Clipboard System
  (defun my-copy-to-clipboard (text)
    (let ((process-connection-type nil))
      (let ((proc (start-process "xclip" nil "xclip" "-selection" "clipboard")))
        (process-send-string proc text)
        (process-send-eof proc))))

  ;; Fungsi untuk Paste dari Clipboard System ke Emacs
  (defun my-paste-from-clipboard ()
    (shell-command-to-string "xclip -selection clipboard -o"))

  (setq interprogram-cut-function 'my-copy-to-clipboard)
  (setq interprogram-paste-function 'my-paste-from-clipboard))


(provide 'modul-emacs-server)
