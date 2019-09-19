;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(map! "M-p"  'move-line-up)
(map! "M-n"  'move-line-down)
(map! "C-x g" 'magit-status)

(setq doom-one-brighter-comments t)

(map! :leader
      (:prefix ("o" . "open")
        (:prefix ("c" . "calibre")
          :desc "technical" "c" (lambda! (aj/open-calibre-book "/mnt/c/Users/samco/Calibre Library/")))
                  ))

(def-package! esqlite  :commands (esqlite-stream-open))

(provide 'config)
;;; config.el ends here
