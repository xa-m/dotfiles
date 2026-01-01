;; search and replace  -*- lexical-binding: t; -*-
(global-set-key (kbd "C-c C-s") #'query-replace-regexp)
(global-set-key (kbd "C-C C-n") #'eval-buffer)
(global-set-key (kbd "C-c k") #'desktop-clear)
(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "C-x b") #'consult-buffer)
(global-set-key (kbd "C-c C-w") #'kill-ring-save)
(global-set-key (kbd "C-c C-y") #'yank-pop)
(global-set-key (kbd "C-=") #'eval-expression)


(defun duplicate-line ()
  "Duplicate Line"
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (move-beginning-of-line 1)
      (kill-line)
      (yank)
      (open-line 1)
      (forward-line 1)
      (yank))
    (move-to-column col)))

(global-set-key (kbd "C-,") 'duplicate-line)
