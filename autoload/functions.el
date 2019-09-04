;;; ~/.doom.d/autoload/functions.el -*- lexical-binding: t; -*-


;;;###autoload
(defun aj/open-calibre-book (base)
    "Select book from calibre database, choose file format and open it.
Requires esqlite and dash.el.
"
    (interactive)
    (ivy-read "Books: "
              (mapcar (lambda (member)
                        (concat (nth 1 member) ": " (nth 0 member)))
                      (esqlite-read (concat base "metadata.db") "SELECT title,id FROM books"))
              :action (lambda (x)
                        (let ((path (aj/return-calibre-book-path x base)))
                          (kill-new path)
                          (find-file path))
                        )
              )
    )

;;;###autoload
(defun aj/return-calibre-book-path (x base)
    "Takes X which represents id and name of book from Calibre database
and returns string representing path to the chosen book file."
    (let* ((id (substring x 0 (string-match ":" x)))
           (db "metadata.db")
           (dbpath (concat base db))
           (path (car (-flatten (esqlite-read dbpath (concat "SELECT path FROM books WHERE id=" id ";")))))
           (name (car (-flatten (esqlite-read dbpath (concat "SELECT name FROM data WHERE book=" id ";")))))
           (formats (esqlite-read dbpath (concat "SELECT format FROM data WHERE book=" id ";")))
           (format (if (> (length formats) 1)
                       (concat "." (downcase (ivy-read "Choose format: " formats)))
                     (concat "." (downcase (car (car formats))))))
           )
      (concat base
              path "/"
              name
              format
              )
      )
      )
