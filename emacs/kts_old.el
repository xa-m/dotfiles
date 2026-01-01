;; -*- lexical-binding: t; -*-
(setq kelimeler '("istese" "aşkına" "köle" "olurum" "tek" "sözüne" "kendimi" "avuturum" "ama" "yok" "inatla" "dönüyoruz" "en" "başına" "hiç" "elimde" "yok" "hiç" "elimde" "yok" "bi" "çare" "kaçamam" "olmuyo" "bu" "kalp" "yerinde" "durmuyo" "sardın" "mı" "en" "başa" "düşmem" "o" "tuzağa" "istiyorum" "ol" "bonnie" "me" "clyde" "kaçalım" "burdan" "aşkın" "yaktı" "beni" "ya" "söndürsene" "o" "zaman" "düştüm" "yoluna" "bul" "beni" "şimdi" "orda" "sorma" "ne" "hâldeyim" "biter" "mi" "korkma" "işte" "burda" "kalbimin" "tek" "sahibi"))

(setq kts-index 0)
(defun kts-space-insert ()
  (interactive)
  (when (>= kts-index (length kelimeler))
    (setq kts-index 0))
  (insert (nth kts-index kelimeler))
  (insert " ")
  (setq kts-index (+ kts-index 1))
  )

(defun kts-index-reset ()
  (interactive)
  (setq kts-index 0))

;(defvar loremipsum-map
;  (let ((map (make-sparse-keymap)))
;    (define-key map (kbd "SPC") 'kts-space-insert)
;    map)
;  "Keymap for my-special-mode")

(defvar kts-mode-map
  (let ((map (make-sparse-keymap)))
    ;; Sadece harf, rakam ve bazı karakterler
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
  "Space tuşuna özel fonksiyon çalıştıran mode."
  :lighter " MyMode"
  :keymap kts-mode-map
  )
