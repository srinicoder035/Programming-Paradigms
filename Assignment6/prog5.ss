#lang racket

(require racket/list)

; NOTE: polynomials are represented inversely
; i.e. '(1 2 3) => 1 + 2x + 3x^2

(define order
  (lambda (poly)
   (sub1 (length poly))))

(define eval
  (lambda (poly x)
    (cond 
      ((= (length poly) 0) 0)
      ((= (length poly) 1) (car poly))
      (else 
        (+ (car poly) (* x (eval (cdr poly) x)))))))

(define zeros
  (lambda (n)
    (if (< n 1)
        '()
        (cons 0 (zeros (- n 1))))))

(define up-degree
  (lambda (poly n)
    (append (zeros n) poly)))

(define scalar
  (lambda (poly d)
    (if (null? poly)
        '()
        (cons (* d (car poly)) (scalar (cdr poly) d)))))

(define add
  (lambda (p1 p2)
    (cond
      ((null? p1) p2)
      ((null? p2) p1)
      (else
       (cons (+ (car p1) (car p2))
             (add (cdr p1) (cdr p2)))))))

(define sub
  (lambda (p1 p2)
    (cond
      ((null? p1) p2)
      ((null? p2) p1)
      (else
        (cons (- (car p1) (car p2))
            (sub (cdr p1) (cdr p2)))))))
            

(define multiply
  (lambda (p1 p2)
    (if (null? p2)
        '(0)
        (add (scalar p1 (car p2))
             (multiply (up-degree p1 1) (cdr p2))))))

(define compose
  (lambda (ls)
    (if (null? ls)
        '(1)
        (multiply (list (* -1 (car ls)) 1)
        (compose (cdr ls))))))

(define (division dividend divisor)
    (define out (list->vector dividend))
      (define normaliser (car divisor))
      (define divisor-length (length divisor))
      (define out-length (vector-length out))
      
      (for ((i (in-range 0 (- out-length divisor-length -1))))
        (vector-set! out i (quotient (vector-ref out i) normaliser))
        (define coef (vector-ref out i))
        (unless (zero? coef) 
          (for ((i+j (in-range (+ i 1)
                                (+ i divisor-length)))
                (divisor_j (in-list (cdr divisor))))
            (vector-set! out i+j (+ (vector-ref out i+j) (* coef divisor_j -1))))))
      (split-at (vector->list out) (- out-length (sub1 divisor-length))))

; defunct
(define poly-to-string
  (lambda (poly)
    (letrec [(convert-to-strings
              (lambda (ls i)
                (if (null? ls)
                    '()
                    (cons
                     (cond [(= i 0) (if (> (car ls) 0)
                                        (string-append "+" (number->string (car ls)))
                                        (string-append "-" (number->string (- (car ls)))))]
                           [(= (car ls) 1) (string-append "+x^" (number->string i))]
                           [#t (string-append 
                                (if (> (car ls) 0)
                                    (string-append "+" (number->string (car ls)))
                                    (string-append "-" (number->string (- (car ls)))))
                                (if (= i 1)
                                    "x"
                                    (string-append "x^" (number->string i))))])
                     (convert-to-strings (cdr ls) (+ i 1))))))]
      (foldl string-append "" (convert-to-strings poly 0)))))

(define N '(1 -12 0 -42))
(define D '(1 -3))
(define-values (A) (add N D))
(printf "Polynomial addition:\nAns: ~a\n\n" (poly-to-string A))
(define-values (M) (multiply N D))
(printf "Polynomial Multiplication:\nAns: ~a\n\n" (poly-to-string M))
(define-values (Q R) (division N D))
(printf "Polynomial division:\nQuotient: ~a\t Remainder: ~a\n" (poly-to-string Q) (poly-to-string R))
; (printf "~a / ~a = ~a remainder ~a~%" N D Q R)