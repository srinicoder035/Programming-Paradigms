#lang scheme
(define (make-stack)
  (let ((stack '()))
    (lambda (msg . args)
      (cond 
        [(eq? msg 'pop!)  (set! stack (cdr stack))]
        [(eq? msg 'push!) (set! stack (append (reverse args) stack))]
        [(eq? msg 'stack) stack]
        [else "Not valid message!"]))))

(define (iterative-tower n x y z)
    (let ((d "D")(a "A")(s "S"))(
            (cond((= (modulo n 2) 0)
                (write "S")
            ))
        )
    )
) 



(define from (make-stack))
(define to (make-stack))
(define temp (make-stack))

(iterative-tower 2 from to temp)