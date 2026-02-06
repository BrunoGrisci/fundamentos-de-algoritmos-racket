;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname conta_multiplos) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; conta-multiplos-3 : ListaDeNumeros Número -> Número
;; Obj: Dada uma lista de números l e um contador começando em zero, conta quantos elementos da lista são múltiplos de 3
;; Exemplos:
;; (conta-multiplos-3 empty 0) => 0
;; (conta-multiplos-3 (cons 3 empty) 0) => 1
;; (conta-multiplos-3 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 0) => 2
(define (conta-multiplos-3 l contador)
    (cond 
     [(empty? l) contador]
     [(= (modulo (first l) 3) 0) (conta-multiplos-3 (rest l) (+ contador 1))]
     [else (conta-multiplos-3 (rest l) contador)]
     )
  )
;; Testes:
(check-expect (conta-multiplos-3 empty 0) 0)
(check-expect (conta-multiplos-3 (cons 3 empty) 0) 1)
(check-expect (conta-multiplos-3 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 0) 2)