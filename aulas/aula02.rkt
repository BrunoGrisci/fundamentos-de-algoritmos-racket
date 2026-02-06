;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BÁSICO

(require 2htdp/image)

0

12

42.5

-9.7

(+ 3 5) ;; 3 + 5

(- 3 5)

(- -3 5)

(* 3 5)

(/ 1 3)

pi

(sqrt 4) ;; computa √4
(expt 4 2) ;; computa 4 ** 2
(quotient 4 2) ;; computa o quociente da divisão inteira 4/2
(quotient 7 2) ;; computa o quociente da divisão inteira 7/2
(remainder 4 2) ;; computa o resto da divisão inteira 4/2
(remainder 7 2) ;; computa o resto da divisão inteira 7/2
(log 45) ;; computa logaritmo natural de 45
(sin pi) ;; computa o seno de pi (em radianos)

'símbolo

'gato

"hello world"

(string-append "hello" "world")
(string-append "hello" " " "world")

(define meio 1/2)

meio

(define terço 1/3)

terço 

(/ 1 3)

(+ meio terço)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNÇÕES

;; F = C x 1,8 + 32
(+ (* 33 1.8) 32)

;; celcius->fahrenheit(temp) = (temp * 1.8) + 32
(define (celcius->fahrenheit temp)
  (+ (* temp 1.8) 32)
  )


(celcius->fahrenheit 33)
(celcius->fahrenheit 0)
(celcius->fahrenheit 37)

(define (fahrenheit->celcius temp)
  (/ (- temp 32) 1.8)
  )

(fahrenheit->celcius 91.4)
(fahrenheit->celcius 32)

(number->string 42)

(define (celcius->fahrenheit-text temp)
  (string-append 
   (number->string temp)
   "oC são "
   (number->string (celcius->fahrenheit temp))
   "oF.")
   )

(celcius->fahrenheit-text 0)
(celcius->fahrenheit-text 37)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IMAGENS

(overlay 
 (star 40 "solid" "yellow") 
 (rectangle 100 100 "solid" "red")
 )

(above 
 (star 40 "solid" "yellow") 
 (rectangle 100 100 "solid" "red")
 )

(beside
 (rectangle 40 80 "solid" "green")
 (rectangle 40 80 "solid" "white")
 (rectangle 40 80 "solid" "red")
 )

;; Texto para imagem
(text "Imagem" 24 "green")

;;(define BarraBranca (rectangle 30 60 "solid" "white") )
;;(define BarraVermelha (rectangle 30 60 "solid" "red") )
;;(define BarraAzul (rectangle 30 60 "solid" "blue") )

;;(beside BarraAzul BarraBranca BarraVermelha)

(define LARGURA 30)
(define ALTURA 60)

(define BarraBranca (rectangle LARGURA ALTURA "solid" "white") )
(define BarraVermelha (rectangle LARGURA ALTURA "solid" "red") )
(define BarraAzul (rectangle LARGURA ALTURA "solid" "blue") )

(beside BarraAzul BarraBranca BarraVermelha)

(define (Barra cor)
  (rectangle LARGURA ALTURA "solid" cor))

(Barra "blue")

(define (Bandeira cor1 cor2 cor3) 
  (beside
   (Barra cor1)
   (Barra cor2)
   (Barra cor3)
   )
  )

(Bandeira "black" "gold" "red")

(define (Bandeira-estrela cor1 cor2 cor3 cor-estrela)
  (overlay 
   (star 10 "solid" cor-estrela)
   (Bandeira cor1 cor2 cor3)
   )
  )

(define camarao (Bandeira-estrela "darkgreen" "red" "yellow" "yellow"))

camarao

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Construa uma função que, dado um número, mostra o número dentro de um círculo vermelho.

(define (num-circ x)
  (overlay 
   (text 
    (number->string x) 24 "black")
   (circle 50 "solid" "red")
   )
  )

(num-circ 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. Uma padaria vende pão por 2 reais, bolinho por 3 reais e croissant por 4 reais. Construa uma função que, dado o números de pães, bolinhos e croissants que o cliente quer comprar, calcula o que ele deve pagar, e mostra dentro de um círculo vermelho.

(define (conta-padaria paes bolinhos croissants) 
  (num-circ
  (+ 
   (* paes 2)
   (* bolinhos 3)
   (* croissants 4)
   )
  )
  )

(conta-padaria 0 1 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (área-do-disco r)
  (* pi (* r r)))

(área-do-disco 10)

(define (área-do-anel raio-externo raio-interno)
  (-(área-do-disco raio-externo) (área-do-disco raio-interno)))

(área-do-anel 10 5)



