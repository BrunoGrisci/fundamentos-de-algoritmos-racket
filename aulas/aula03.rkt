;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;area-circ : Número -> Número
(define (area-circ r)
  (* 3.14 (sqr r)))

(area-circ 5)

;;area-anel : Número Número -> Número
;;Objetivo: Dados dois números que correspondem aos raios externo e interno de um anel, calcular sua área
;;Exemplo:
;;(area-anel 5 3) = 50.24
(define (area-anel raio-ext raio-int)
  (-
   (area-circ raio-ext) ;; calcula a área do disco externo
   (area-circ raio-int) ;; calcula a área do disco interno
   )
  )
;;Testes:
(check-expect (area-anel 5 3) 50.24)

(area-anel 1 3)