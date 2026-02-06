;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 2htdp/image)

(string=? "A" "a")

(define (g n)
  (cond 
    [(= n 1) n]
    [(> n 2) (- n 1)]
    [else (- n 2)]))

(define (f x)
  (* 2 (g x)))

;;==================================================
;; CALCULA-NOTA:
;; calcula-nota : Número Número Número -> Imagem
;; Obj: Dadas as notas de 3 trimestres de um aluno
;; devolve uma imagem da nota final do aluno dentro de uma estrela amarela,
;; caso ele tenha atingido a média 7, e dentro de um círculo vermelho, caso contrário.
;; A nota final do aluno é uma média ponderada, onde a primeira nota tem peso 1,
;; a segunda peso 2 e a terceira peso 3.

;; Exemplos:
;; (calcula-nota 8 9 10) => estrela amarela com o número 9.3 escrito em preto dentro
;; (calcula-nota 2 5 8) => círculo vermelho com o número 6.0 escrito em vermelho dentro

(define (calcula-nota p1 p2 p3)
  (mostra-media
   (calcula-media p1 p2 p3)))
;; Testes:
(check-expect (calcula-nota 8 9 10) (overlay (text "9.3" 20 "black") (star 60 "solid" "yellow")))
(check-expect (calcula-nota 2 5 8) (overlay (text "6.0" 20 "black") (circle 40 "solid" "red")))

;;==================================================
;; CALCULA-MEDIA:
;; calcula-media : Número Número Número -> Número
;; Obj: Dadas 3 notas, calcula a média ponderada onde a primeira nota tem peso 1, a segunda peso 2 e a 
;; terceira peso 3
;; Exemplos:
;; (calcula-media 9 9 10) = 9.5
;; (calcula-media 2 5 8) = 6.0
(define (calcula-media p1 p2 p3)
  (/
   (+ p1
      (* p2 2)
      (* p3 3))
   6))
;; Testes:
(check-expect (calcula-media 9 9 10) 9.5)
(check-expect (calcula-media 2 5 8) 6)
(check-expect (calcula-media 8.33 5.33 8.79) 7.56)
(check-within (calcula-media 8 9 10) 9.3 0.04) ;; o resultado é inexato, 0.04 é o intervalo de erro aceitável

;;==================================================
;; MOSTRA-MEDIA:
;; mostra-media : Número -> Imagem
;; Obj: Dada a nota do aluno, mostra esta nota dentro de uma estrela amarela se ela for igual ou maior 
;; que 7 ou dentro de um círculo vermelho se for menor que 7
;; Exemplos:
;; (mostra-media 8.7) =
;; (mostra-media 4.1) =
(define (mostra-media n)
  ;; dado um número n
  (cond
   ;; se n for maior ou igual a 7, mostrar em uma estrela
   [(>= n 7) (mostra-media-estrela 7)]
   ;; senão, mostrar em um círculo
   [else (mostra-media-circulo n)]
  ))
;; Testes:

;; 8.763 => 87.63 => 88 => 8
(define (numero1CasaDec n)
  (exact->inexact 
   (/
    (round 
     (* n 10)) 10)))

;;==================================================
;; MOSTRA-MEDIA-ESTRELA:
;; mostra-media-estrela : Número -> Imagem
;; Obj:
;; Exemplos:
;; (mostra-media-estrela 8.7) =
;; (mostra-media-estrela 7) =
;; (mostra-media-estrela 1.6) = 
(define (mostra-media-estrela n)
  ;; sobrepor a imagem do número n em uma estrela amarela
  (overlay
   (text (number->string (numero1CasaDec n)) 20 "black")
   (star 50 "solid" "yellow"))
  )

;;==================================================
;; MOSTRA-MEDIA-CIRCULO:
;; mostra-media-circulo : Número -> Imagem
;; Obj:
;; Exemplos:
;; (mostra-media-circulo 8.7) =
;; (mostra-media-circulo 7) =
;; (mostra-media-circulo 1.6) = 
(define (mostra-media-circulo n)
  ;; sobrepor a imagem do número n em um circulo vermelho
  (overlay
   (text (number->string (numero1CasaDec n)) 20 "black")
   (circle 30 "solid" "red"))
  )


(calcula-nota 8 9 10)

(calcula-nota 2 5 8)



