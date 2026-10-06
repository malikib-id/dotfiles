
;; ========== ELDOC ==========
;; Saat kamu mengetik fungsi/class, parameternya muncul di echo area (bawah), bukan pop-up
(use-package eldoc
  :config
  (setq eldoc-idle-delay 0.1))

;; 1. Atur Flymake (Indikator Eror Merah/Kuning di Samping Kiri)
(use-package flymake
  :hook (typescript-ts-mode . flymake-mode)
  :config
  ;; Menampilkan tanda seru / indikator di kolom kiri (fringe)
  (setq flymake-fringe-indicator-position 'left-fringe))

;; 2. Matikan Pop-up Otomatis Company Mode
(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay nil           ; NIL = Matikan total pop-up otomatis saat mengetik
        company-minimum-prefix-length 99 ; Mencegah pemicu otomatis lainnya
        company-tooltip-limit 10))


;; ========== EGLOT ==========

;; 2. KONFIGURASI PAKET (ELDOC, FLYMAKE, COMPANY, YAML)
;; Eldoc
(setq eldoc-idle-delay 0.5)

;; Flymake
(setq flymake-fringe-indicator-position 'left-fringe)

;; Company Mode
(require 'company nil t)
(when (fboundp 'global-company-mode)
  (global-company-mode)
  (setq company-idle-delay nil
        company-minimum-prefix-length 99
        company-tooltip-limit 10)
  (global-set-key (kbd "M-/") 'company-complete))

;; Yaml
(require 'yaml-mode nil t)

;; 3. EGLOT (LSP CLIENT) & SERVER PROGRAMS
(require 'eglot nil t)
(with-eval-after-load 'eglot
  ;; Silencer Python
  (setq-default eglot-workspace-configuration
                '((:pylsp :plugins (:pycodestyle (:enabled :json-false)
                                    :flake8 (:enabled :json-false)
                                    :mccabe (:enabled :json-false)
                                    :preload (:enabled t)))))
  
  ;; Registrasi Server TS & Clangd secara aman
  (add-to-list 'eglot-server-programs
               (cons '(typescript-mode typescript-ts-mode)
                     (list "/home/malikib/.npm-global/bin/typescript-language-server" "--stdio")))
  
  (add-to-list 'eglot-server-programs
               (cons '(c-mode c++-mode c-ts-mode c++-ts-mode)
                     (list "clangd" "--background-index" "--clang-tidy" "--header-insertion=iwyu"))))

;; Shortcut Reconnect F12
(add-hook 'eglot-managed-mode-hook
          (lambda () (local-set-key (kbd "<f12>") 'eglot-reconnect)))

;; 4. PROJECT MANAGEMENT
(with-eval-after-load 'project
  (add-to-list 'project-vc-extra-root-markers "tsconfig.json")
  (setq project-vc-ignores '("node_modules/" ".main/")))

;; 5. KAITAN HOOKS (BAHASA PEMROGRAMAN)
;; Python
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'flymake-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (setq python-indent-offset 4)
            (local-set-key (kbd "RET") 'newline-and-indent)))

;; C, C++, Go, YAML
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'yaml-mode-hook 'eglot-ensure)

;; TypeScript & Tree-sitter
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'flymake-mode)

(provide 'modul-lsp)
