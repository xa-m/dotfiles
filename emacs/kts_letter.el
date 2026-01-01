;; -*- lexical-binding: t; -*-
(setq kelimeler '("İstese " "aşkına " "köle " "olurum\n" "Tek " "sözüne " "kendimi " "avuturum\n" "Ama " "yok, " "inatla " "dönüyoruz " "en " "başına\n\n" "Hiç " "elimde " "yok " "hiç " "elimde " "yok " "bi " "çare\n" "Kaçamam " "olmuyo, " "bu " "kalp " "yerinde " "durmuyo\n" "Sardın " "mı " "en " "başa? " "Düşmem " "o " "tuzağa\n" "İstiyorum " "ol " "Bonnie " "and " "Clyde, " "kaçalım " "burdan\n\n" "Aşkın " "yaktı " "beni " "ya\n" "Söndürsene " "o " "zaman\n" "Düştüm " "yoluna " "bul " "beni " "şimdi " "orda\n" "Sorma " "ne " "hâldeyim, " "biter " "mi? " "Korkma\n" "İşte " "burda " "kalbimin " "tek " "sahibi."))

(setq kts-full-text (apply 'concat kelimeler))
(setq kts-index 0)

(defun kts-space-insert ()
  (interactive)
  (if (>= kts-index (length kts-full-text))
      (progn
        (setq kts-index 0)
        (kts-mode -1))
    (insert (substring kts-full-text kts-index (1+ kts-index)))
    (setq kts-index (1+ kts-index))))

(defun kts-index-reset ()
  (interactive)
  (setq kts-index 0))

(defvar kts-mode-map
  (let ((map (make-sparse-keymap)))
    (dotimes (i 26)
      (define-key map (kbd (char-to-string (+ ?a i))) 'kts-space-insert)
      (define-key map (kbd (char-to-string (+ ?A i))) 'kts-space-insert))
    (dotimes (i 10)
      (define-key map (kbd (char-to-string (+ ?0 i))) 'kts-space-insert))
    (define-key map (kbd "SPC") 'kts-space-insert)
    (define-key map (kbd ".") 'kts-space-insert)
    (define-key map (kbd ",") 'kts-space-insert)
    (define-key map (kbd ";") 'kts-space-insert)
    (define-key map (kbd "[") 'kts-space-insert)
    (define-key map (kbd "]") 'kts-space-insert)
    (define-key map (kbd "\\") 'kts-space-insert)
    (define-key map (kbd "=") 'kts-space-insert)
    (define-key map (kbd "-") 'kts-space-insert)
    map)
  "Keymap for kts-mode")

(define-minor-mode kts-mode
  "Output the lyrics of the favorite song of Hilmi Yavuzhan"
  :lighter " KTS"
  :keymap kts-mode-map)

