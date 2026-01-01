(defun rdocs (topic)
  "Searches the word in local rust docs (rustup docs)"
  (interactive "sRustup doc (default std): ")
  (let ((final-topic (if (string-empty-p topic) "--std" topic)))
    (message "Loading: %s" final-topic)
    (shell-command (concat "rustup doc " final-topic))))
