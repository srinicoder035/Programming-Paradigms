#lang scheme

; Tail Recursion

(define (factorial n)
    (do ((rem n (sub1 rem)) 
        (ans 1 (* ans rem)))
            ((zero? rem) ans)
        (display "")))

(factorial 3)

;Loop

(define (factorial1 x)
    (let loop((x x)
        (acc 1))
        (if (zero? x)
            acc
            (loop (sub1 x) (* x acc)))))

(factorial1 5)