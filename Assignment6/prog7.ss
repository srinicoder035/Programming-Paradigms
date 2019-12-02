#lang racket

(define (nth list n)
  (let iter ((n n) (result list))
    (if (= n 0)
        (car result)
        (iter (- n 1)
              (cdr result)))))

(define matrix-row nth)

(define (matrix-col M n)
  (let iter ((i (length M)) (result '()))
    (if (= i 0)
        result
        (iter (- i 1)
              (cons (nth (nth M (- i 1)) n) result)))))

(define (reduce fun lst)
  (let iter ((result (car lst)) (lst (cdr lst)))
    (if (null? lst)
        result
        (iter (fun result (car lst)) (cdr lst)))))



(define (matrix-mul N M)
  (let rows ((i (length N)) (result '()))
    (if (= i 0)
        result
        (rows (- i 1)
              (cons
               (let cols ((j (length (car M))) (row '()))
                 (if (= j 0)
                     row
                     (cols
                      (- j 1)
                      (cons (reduce + (map *
                                           (matrix-row N (- i 1))
                                           (matrix-col M (- j 1))))
                            row))))
               result)))))


(define M1 '((1 0 0) (0 1 0) (0 0 1)))
(define M2 '((1 0 0) (0 1 0) (0 0 1)))
(write (matrix-mul M1 M2))
(newline)
