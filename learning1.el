;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(setq objects '(whiskey-bottle bucket frog chain))

(setq map '((living-room (you are in the living room)
			 (west door garden)
			 (upstairs stairway attic))
	    (garden (you are in a beautiful garden)
		    (east door living-room))
	    (attic (you aare in the attic)
		   (downstairs stairway living-room))
     	    ))

(setq object-locations '((whiskey-bottle living-room)
			 (bucket living-room)
			 (chain garden)
			 (frog garden)))

(setq location 'living-room)

(defun describe-location (location map)
  (second (assoc location map)))

;(describe-location 'living-room map)
(defun describe-path (path)
  '(there is a ,(second path) going ,(first path) from here -))

(defun describe-paths (location map)
  (apply #'append (mapcar #'describe-path (cddr (assoc location map)))))

(describe-paths 'living-room map)

(describe-path '(west door garden))


(defun is-at (obj loc obj-loc)
  (eq (second (assoc obj obj-loc)) loc))

(is-at 'whiskey-bottle 'living-room object-locations)

(defun describe-floor (loc objs obj-loc)
  (apply #'append (mapcar (lambda(x)
			    '(you see a ,x on the floor))
			  (remove-if-not (lambda(x)
					   (is-at x loc obj-loc))
					 objs))))

(describe-floor 'living-room objects object-locations)

(defun look()
  (append (describe-location location map)
	  (describe-paths location map)
	  (describe-floor location objects object-locations)))
(look)
