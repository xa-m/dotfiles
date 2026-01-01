(defun dired-view-file-read-only ()
  "View file in dired-mode with V"
  (interactive)
  (let ((find-file-run-dired t))
    (view-file (dired-get-file-for-visit))))
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "V") #'dired-view-file-read-only))
