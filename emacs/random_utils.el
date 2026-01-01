;; -*- lexical-binding: t; no-byte-compile: t -*-
(defun es ()
  "Opens Eshell on another window"
  (interactive)
  (let ((w (selected-window)))
    (let ((w2 (split-window w 20)))
      (select-window w2)
      (eshell)
      )))

(defun dired-view-file-read-only ()
  "View file in dired-mode with V"
  (interactive)
  (let ((find-file-run-dired t))
    (view-file (dired-get-file-for-visit))))
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "V") #'dired-view-file-read-only))

(defun rdocs (topic)
  "Searches the word in local rust docs (rustup docs)"
  (interactive "sRustup doc (default std): ")
  (let ((final-topic (if (string-empty-p topic) "--std" topic)))
    (message "Loading: %s" final-topic)
    (shell-command (concat "rustup doc " final-topic))))

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

(defun lsp-kill ()
  "Disconnects from LSP server and closes Flymake"
  (interactive)
  (lsp-disconnect)
  (flymake-mode -1))
