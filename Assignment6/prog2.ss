#lang scheme

(define (sum l)
    (let loop((s 0)(l l))
        (cond
            ((null? l) s)
            (true (display s) (newline)(set! s (+ s (car l)))(loop s (cdr l)))
        )
    )
)

(printf "intermediate sum values")
(sum '(1 2 3 4 5))