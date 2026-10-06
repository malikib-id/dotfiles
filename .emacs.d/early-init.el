;;; early-init.el --- Fondasi Performa & GUI -*- lexical-binding: t; -*-

;; [DARI CONFIG ANDA] 1. Naikkan batas GC setinggi mungkin saat startup
(setq gc-cons-threshold 100000000)

;; [DARI CONFIG ANDA] 3. Matikan double buffering sejak awal untuk hilangkan flickr/kedipan
(setq w32-disable-double-buffering t)

;; [DARI CONFIG ANDA] 4. Matikan pemuatan package bawaan agar tidak bottleneck di awal
(setq package-enable-at-startup nil)

;; [TAMBAHAN WAJIB] Matikan elemen GUI putih bawaan sebelum frame dibuat
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(push '(background-color . "#1e1e2e") default-frame-alist) ; Latar langsung hitam Catppuccin
