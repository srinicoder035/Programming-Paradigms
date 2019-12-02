#lang scheme

; Defining a stack type 

(define (make-stack)
  (let ((stack '()))
    (lambda (msg . args)
      (cond 
        [(eq? msg 'pop!)  (set! stack (cdr stack))]
        [(eq? msg 'push!) (set! stack (append (reverse args) stack))]
        [(eq? msg 'stack) stack]
        [else "Not valid message!"]))))

(define s (make-stack))
(s 'push! 'a)
(s 'push! 'b 'c 'd)
(s 'stack)
(s 'pop!)
(s 'stack)

; Defining using class

(define human-c
  (make-class ()
    (:name :favorite-drink)))

(define Person1
  (make-instance human-c
    ':name "ABCD"
    ':favorite-drink
      (string-append
        "warm" " " "milk")))



