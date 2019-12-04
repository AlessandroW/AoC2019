(setq raw-input "1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,10,19,23,1,6,23,27,1,5,27,31,1,10,31,35,2,10,35,39,1,39,5,43,2,43,6,47,2,9,47,51,1,51,5,55,1,5,55,59,2,10,59,63,1,5,63,67,1,67,10,71,2,6,71,75,2,6,75,79,1,5,79,83,2,6,83,87,2,13,87,91,1,91,6,95,2,13,95,99,1,99,5,103,2,103,10,107,1,9,107,111,1,111,6,115,1,115,2,119,1,119,10,0,99,2,14,0,0
")
(defun to-list (raw-input)
  (mapcar 'string-to-number (split-string raw-input ",")))

(setq input (to-list raw-input))

(defun get-next (current-idx)
  (+ current-idx 4))

(defun add (list current-idx)
  (apply '+ (next-two list current-idx)))

(defun mult (list current-idx)
  (apply '* (next-two list current-idx)))

(defun next-two (input current-idx)
  (list (nth (nth (+ 1 current-idx) input) input)
        (nth (nth (+ 2 current-idx) input) input)))

(defun eval-optcode (input idx)
  (cond ((= (nth idx input) 1) (setcar (nthcdr (nth (+ 3 idx) input) input) (add input idx)))
        ((= (nth idx input) 2) (setcar (nthcdr (nth (+ 3 idx) input) input) (mult input idx))))
  input)

(defun solve-part-1 (input)
  (setq idx 0)
  (setq run t)
  (while run
    (setq input (eval-optcode input idx))
    ;; (message "Step: %s" input)
    (if (= 99 (nth idx input))
        (setq run nil))
    (setq idx (get-next idx)))
  (message "Solution: %d" (nth 0 input))
  )

(solve-part-1 input)
