;;; setup-sudo-edit.el --- Otomatis buka file sistem sebagai root -*- lexical-binding: t; -*-

(defun my/auto-sudo-edit-current-file ()
  "Otomatis membuka ulang file saat ini sebagai root menggunakan TRAMP jika berada di direktori sistem."
  (interactive)
  (when (and buffer-file-name
             (not (file-remote-p buffer-file-name)) ; Jangan ganggu jika sudah file remote (Tailscale/SSH luar)
             (or (not (file-writable-p buffer-file-name))
                 (string-match-p "^/etc/" buffer-file-name)
                 (string-match-p "^/opt/" buffer-file-name)
                 (string-match-p "^/usr/" buffer-file-name)))
    (let ((position (point)))
      (find-alternate-file (concat "/sudo::" buffer-file-name))
      (goto-char position))))

(provide 'modul-sudo-edit)
;;; setup-sudo-edit.el ends here
