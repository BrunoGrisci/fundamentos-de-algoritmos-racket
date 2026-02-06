;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname prova01_questao_listas) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Exemplos de elementos do conjunto Posn:

(define POSN1 (make-posn 2 3))
(define POSN2 (make-posn 2 4))
(define POSN3 (make-posn 4 3))

;; Exemplos de elementos do conjunto ListaPosn:

(define LISTA1 (cons POSN1 (cons POSN2 empty)))
(define LISTA2 (cons POSN1 (cons POSN3 (cons POSN1 empty))))
(define LISTA3 (cons POSN1 (cons POSN2 (cons POSN1 (cons POSN1 empty)))))

(define (funcA arg)
  (cond
    [(empty? arg) 0]
    [else (+ 1 (funcA (rest arg)))]
   )
  )

(define (funcB arg)
  (cond
   [(empty? arg) (make-posn 0 0)]
   [else (make-posn (+ (posn-x (first arg)) (posn-x (funcB (rest arg)))) 
                    (+ (posn-y (first arg)) (posn-y (funcB (rest arg)))))]
   )
  )

(define (funcC arg)
  (make-posn (/ (posn-x (funcB arg)) (funcA arg))
             (/ (posn-y (funcB arg)) (funcA arg))
            )
  )

(funcC LISTA1)

