;; ======================================================
;; AI
;; ======================================================

;; AI Agent
;; 1. Set API Key OpenRouter agar terbaca oleh sistem
(getenv "OPENROUTER_API_KEY")
;; 2. Konfigurasi Paket Aidermacs 
(use-package aidermacs
  :ensure t
  :config
  ;; Gunakan backend comint (standar buffer Emacs)
  (setq aidermacs-backend 'comint) 

  (if (getenv "OPENROUTER_API_KEY")
      (setq aidermacs-openrouter-api-key (getenv "OPENROUTER_API_KEY"))
    (setq aidermacs-openrouter-api-key ""))

  :custom
  ;; Menentukan model NVIDIA Nemotron Free via OpenRouter
  (aidermacs-default-model "openrouter/nvidia/nemotron-3.5-lightning:free")
  
  ;; Mode interaksi default (architect adalah mode standar koding yang direkomendasikan)
  (aidermacs-default-chat-mode 'architect)
  
  ;; Argumen tambahan dasar (Bahasa Indonesia & matikan auto-commit)
  (aidermacs-extra-args '("--chat-language" "Indonesian" "--no-auto-commits")))

;; 3. Shortcut aman menggunakan tombol F12
(global-set-key (kbd "<f12>") 'aidermacs-transient-menu)

;; LLMs
(setq gptel-expert-commands t)
(setq gptel-model  'nvidia/nemotron-3-super-120b-a12b:free
      gptel-max-tokens 4000
      gptel-backend
      (gptel-make-openai "OpenRouter" 
        :host "openrouter.ai"
        :endpoint "/api/v1/chat/completions"
        :stream t
        :key (lambda () (or (getenv "GPTEL_API_KEY") ""))
        :models '(nvidia/nemotron-3-super-120b-a12b:free
		  cohere/north-mini-code:free
		  poolside/laguna-xs-2.1:free)))
(global-set-key (kbd "<f7>") 'gptel-menu)
(global-set-key (kbd "<f8>") 'gptel-rewrite)  
(global-set-key (kbd "<f9>") 'gptel)


;; ======== AGENT SHELL ==========
;; 1. Daftarkan folder lokal bin tempat Goose diinstal ke Emacs
(add-to-list 'exec-path "/home/malikib/.local/bin")
(setenv "PATH" (concat "/home/malikib/.local/bin:" (getenv "PATH")))

;; 2. Beritahu agent-shell untuk menyamakan nama model dengan konfigurasi terminal Anda
(with-eval-after-load 'agent-shell-goose
  (setq agent-shell-goose-environment 
        '(("OPENAI_MODEL" . "qwen/qwen3.8-27b-free"))))


;; modul-agent.el --- Konfigurasi Agent-Shell Full Screen & Bersih

(use-package agent-shell
  :ensure t
  :config
  ;; Aturan display-buffer-alist 40% SUDAH DIHAPUS 
  ;; agar agent-shell terbuka normal/layar penuh mengikuti ruang jendela yang aktif
  nil

  :hook
  ;; UI TWEAKS UNTUK TEMPAT MAGNAG
  (agent-shell-mode . (lambda ()
                        ;; 1. Hilangkan angka baris di samping kiri agar bersih
                        (display-line-numbers-mode -1)
                        ;; 2. Perbesar ukuran font khusus buffer ini agar enak dibaca (+1.5 tingkat)
                        (text-scale-increase 1.2))))


(require 'agent-shell)
(setq agent-shell-openai-authentication
      (agent-shell-openai-make-authentication :login t))

(global-set-key (kbd "<f4>") 'agent-shell)

;; Membatasi agent agar tidak memindai terlalu banyak berkas sekaligus
(setq agent-shell-max-project-files 5)

(provide 'modul-ai)



;;; modul-agent.el --- Konfigurasi Agent-Shell Full Screen & Bersih

;; (use-package agent-shell
;;   :ensure t
;;   :config
;;   ;; Aturan display-buffer-alist 40% SUDAH DIHAPUS 
;;   ;; agar agent-shell terbuka normal/layar penuh mengikuti ruang jendela yang aktif
;;   nil

;;   :hook
;;   ;; UI TWEAKS UNTUK TEMPAT MAGNAG
;;   (agent-shell-mode . (lambda ()
;;                         ;; 1. Hilangkan angka baris di samping kiri agar bersih
;;                         (display-line-numbers-mode -1)
;;                         ;; 2. Perbesar ukuran font khusus buffer ini agar enak dibaca (+1.5 tingkat)
;;                         (text-scale-increase 1.5)))

;; )
;; (global-set-key (kbd "<f4>") 'agent-shell)





