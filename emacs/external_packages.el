;; -*- lexical-binding: t; -*-
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


;; MAC ENV VARIABLE FIX
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize)
  (setq native-comp-jit-compilation t))

(use-package gruber-darker-theme)
(load-theme 'gruber-darker)

(use-package snow
  :defer t)
(use-package fireplace
  :defer t)
(use-package rust-mode
  :defer t)
(use-package go-mode
  :defer t)
(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)       ;; Tab karakterinin genişliği
            (setq indent-tabs-mode t) ;; Tab kullan
            ))
(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-'") 'avy-goto-char))

(use-package magit
  :ensure t
  :defer t)

(use-package dired-du
  :defer t
  :config
  (when (eq system-type 'darwin)
    (setq dired-du-used-space-program '("gdu" "-sb"))
    )
  (setq dired-du-size-format t)
  )

(use-package vertico
  :ensure t
  :config
  (vertico-mode)
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package consult
  :defer t
  :ensure t)

(use-package multiple-cursors
  :defer t
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (setq c-basic-offset 4)
	    (setq tab-width 4)))

;; alterantive "PATH" environment variable in case of an problem
;; (add-to-list 'exec-path "/opt/homebrew/bin")
;; (setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH")))

;; (let ((my-lib-path "/opt/homebrew/lib/gcc/15/libgccjit.dylib"))
;;   (if (and (file-exists-p my-lib-path) (executable-find "gcc-15"))
;;       (setq native-comp-jit-compilation t)
;;     (setq native-comp-jit-compilation nil)))
