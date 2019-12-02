#lang racket

(define (towers-of-hanoi n source dest temp)
  (cond [(= n 1)
         (printf "Move the disk from ~a to ~a~n" source dest)]
        [else
         (towers-of-hanoi (- n 1) source temp dest)
         (printf "Move the disk from ~a to ~a~n" source dest)
         (towers-of-hanoi (- n 1) temp dest source)]))

(towers-of-hanoi 3 "source" "destination" "temporary")
