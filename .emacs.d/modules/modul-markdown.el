;;; modul-markdown.el --- Tampilan Markdown Khusus dengan Background Berbeda

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :config
  ;; Mengaktifkan word wrap otomatis
  (add-hook 'markdown-mode-hook 'visual-line-mode)

  ;; Menonaktifkan line number khusus di mode markdown
  (add-hook 'markdown-mode-hook (lambda () (display-line-numbers-mode -1)))

  ;; Mematikan garis putus-putus vertikal
  (add-hook 'markdown-mode-hook (lambda () (display-fill-column-indicator-mode -1)))

  ;; BARU: Mengubah warna background khusus untuk Markdown mode
  ;; Anda bisa mengganti "#1a1a1a" dengan warna hex lain sesuai selera Anda
  (add-hook 'markdown-mode-hook
            (lambda ()
              (face-remap-add-relative 'default :background "#0f141c")))

  ;; Menggunakan olivetti untuk tampilan center (seperti Word)
  (use-package olivetti
    :ensure t
    :hook (markdown-mode . olivetti-mode)
    :config
    (setq olivetti-body-width 70)
    
    ;; Menyesuaikan warna fringe (pinggiran baju/pembatas) agar mengikuti background baru
    (add-hook 'markdown-mode-hook
              (lambda ()
                (set-face-background 'fringe (face-background 'default))))))


(provide 'modul-markdown)
;;; Modul-markdown.el ends here
