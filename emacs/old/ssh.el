(defun ssh ()
  "Connect to the server with TRAMP"
  (interactive)
  (let ((host (read-string "SSH to (user@host or name): ")))
    (if (string-empty-p host)
        (message "No host provided")
      (find-file (concat "/ssh:" host ":/home")))))


(defun ssh-close ()
  "Close all SSH connections"
  (interactive)
  (tramp-cleanup-all-connections)
  (message "TRAMP/SSH buffers are cleaned up."))
