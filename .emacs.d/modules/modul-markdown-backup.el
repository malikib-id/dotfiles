;;; modul-markdown.el --- Pengaturan Berkas Catatan Markdown 40%

;; 1. Otomatis pasang markdown-mode dan csv-mode jika belum ada
(unless (package-installed-p 'csv-mode)
  (package-refresh-contents)
  (package-install 'csv-mode))

(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode))

;; 2. Kaitkan ekstensi berkas .md otomatis ke mode ini
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

;; 3. Setup Grip Mode untuk preview (opsional)
(use-package grip-mode
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'markdown-mode
    (define-key markdown-mode-map (kbd "C-c C-g") 'grip-mode)))

;; 4. KUNCI JENDELA: Memaksa setiap berkas Markdown (.md) terbuka 40% di kanan
(add-to-list 'display-buffer-alist
             '("\\.md\\'"
               (display-buffer-in-side-window)
               (side . right)
               (window-width . 0.4)
               (dedicated . t)))

;; PENTING: Wajib tulis ini di paling bawah!
;; (provide 'modul-markdown)
