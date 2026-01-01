;; -*- lexical-binding: t; -*-
(setq lsp-completion-provider :capf)
(use-package lsp-mode
  :defer t
  :ensure t
  :config
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-auto-start nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-signature-auto-activate nil)
    )
(use-package lsp-treemacs
  :defer t
  :ensure t)

;; (use-package corfu
;;   :custom
;;   (corfu-cycle t)
;;   (corfu-auto t)
;;   (corfu-quit-no-match 'separator)
;;   (corfu-preselect 'prompt)
;;   :bind
;;   (:map corfu-map
;;         ("TAB" . corfu-next)
;;         ("S-TAB" . corfu-previous)))

(use-package company
  :ensure t
  :defer t
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  :init
  (global-company-mode)
  :config
  (setq company-tooltip-align-annotations t))

;;(use-package dap-mode
;;  :after lsp-mode
;;  :config
;;  (dap-ui-controls-mode -1)
;; (dap-tooltip-mode -1)    
;;  (dap-auto-configure-mode)
;;  (require 'dap-gdb))

;;(add-hook 'c-mode-hook 'lsp)
;;(add-hook 'rust-mode-hook 'lsp)
;;(with-eval-after-load 'lsp-mode
;;  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
