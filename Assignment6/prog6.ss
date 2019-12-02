#lang scheme

(define (sortString a)
    (list->string (sort(string->list a)char<?))
)

(define x (read-line))
(sortString x)
