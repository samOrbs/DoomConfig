;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(map! "M-p"  'move-line-up)
(map! "M-n"  'move-line-down)
(map! "C-x g" 'magit-status)

(setq doom-one-brighter-comments t)

(map! :leader
      (:prefix ("o" . "open")
        (:prefix ("c" . "calibre")
          :desc "technical" "c" (lambda! (aj/open-calibre-book "Calibre Library/")))
                  ))

(def-package! esqlite  :commands (esqlite-stream-open))

(provide 'config)
;;; config.el ends here
