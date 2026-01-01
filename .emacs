;; -*- lexical-binding: t; -*-
(setq native-comp-jit-compilation nil) ;; is enabled again in external_packages.el

(tool-bar-mode -1)
(menu-bar-mode)
(scroll-bar-mode -1)
(fringe-mode -1)
(desktop-save-mode 1)
(electric-pair-mode 1)
(desktop-file-name ".emacs.desktop" "~/.emacs.d/")
(setq dired-listing-switches "-alh")
(setq inhibit-startup-screen t)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))
(setq custom-file "~/.emacs.custom")
(load-file "~/.emacs.custom")
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))
(set-face-attribute 'default nil :font "Iosevka-20")
;; PACKAGES
(load "~/emacs/external_packages.el")
;; OTHER FILES
(load "~/emacs/kts_letter")
(load "~/emacs/random_utils")
(load "~/emacs/_bindings")
(load "~/emacs/lsp")
(load "~/emacs/native_comp")

(put 'dired-find-alternate-file 'disabled nil) ; a key in dired


;; BUILD GUIDE FOR FUTURE GENERATIONS
;; download autoconfigure shits dependency and run that then run the cofigure
;; configure flags: --with-ns --with-native-compilation --with-tree-sitter --with-json --with-gnutls
;; Emacs native compilation depends on libgccjit which is not exposed by default to .app's by default. which requires you to expose the path of the libgccjit to emacs. I have downloaded libgccjit with brew and binaries is in the homebrew/bin.
;; Interestingly emacs does not require gcc (which is not accesibly to emacs by default) itself. Only exposing the libgccjit is seems to be enough
;; DEPENDENCIES: gcc and libgccjit (for native compilation), gdu (for dired-du), 
