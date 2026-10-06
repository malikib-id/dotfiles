;; ===================================================
;; CSS & HTML
;; ===================================================

(unless (package-installed-p 'emmet-mode)
  (package-refresh-contents)
  (package-install 'emmet-mode))
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Gunakan web-mode untuk file HTML dan CSS
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"  . web-mode))

;; Auto-close tag secara otomatis saat ketik ">"
(setq web-mode-auto-close-style 2)  ;; 2 = auto-close tag
(setq web-mode-enable-auto-indentation t) ;; auto-indent
(setq web-mode-enable-auto-pairing t)      ;; auto-pair quotes, braces

(add-hook 'web-mode-hook 'emmet-mode)  ;; untuk HTML/CSS
(setq emmet-move-cursor-between-quotes t) ;; kursor otomatis di dalam quotes
;; Shortcut expand Emmet
(require 'emmet-mode) ;; pastikan mode ter-load dulu

;; Aktifkan emmet-mode di html/css
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; Contoh keybinding: Ctrl+j
(define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line)

(provide 'modul-webmode)
