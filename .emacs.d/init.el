;; ======================================================
;; SETUP EMACS
;; ======================================================
;; ========== Package  ==========
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(package-selected-packages
   '(agent-shell aidermacs cmake-ide cmake-mode cmake-project company corfu
		 csv-mode diminish edit-indirect emmet-mode flycheck flymd gptel
		 grip-mode htmlize magit markdown-preview-mode olivetti
		 prettier-js undo-fu valign vterm-toggle web-mode yaml-mode)))

(global-company-mode 1)


;; ========== Module ==========
;; Walaupun berkas ini ada di ~/.emacs, kita suruh dia membaca folder di ~/.emacs.d
(add-to-list 'load-path (expand-file-name "~/.emacs.d/modules/"))

;; Sekarang tinggal panggil modulnya satu per satu
(require 'modul-sudo-edit)
(require 'modul-perform)
(require 'modul-ui)
(require 'modul-ux)
(require 'modul-dashboard)
(require 'modul-lsp)
(require 'modul-shortcut)
(require 'modul-backup)
(require 'modul-terminal)
(require 'modul-git)
(require 'modul-ai)
(require 'modul-webmode)
(require 'modul-markdown)


;; khusus mode emacs client
(require 'modul-emacs-server)


;; CARA PANGGIL YANG BENAR (Arah folder modules/modul-key.el)
(let ((secret-file (expand-file-name "modules/modul-key.el" user-emacs-directory)))
  (when (file-exists-p secret-file)
    (load secret-file)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "blue" :foreground "white" :bold t))))
 '(show-paren-mismatch ((t (:background "red" :foreground "white" :bold t)))))
