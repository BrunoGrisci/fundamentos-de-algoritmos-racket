;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 2htdp/image)

(+ 2 3) ;; expressão aritmética = expressão cujo resultado é um número

(circle 50 "solid" "red") ;; expressão cujo resultado é uma imagem

(string-append "AAA" "BBB") ;; expressão cujo resultado é uma palavra (string)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#true ;; booleano verdadeiro

#false ;; booleano falso

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(< 1 2)

(= 3 4)

(= 2 2)

(> 3 4)

;; (> x 1)

(positive? pi)

(string? 70)
(string? "algoritmo")

(number? 70)
(number? "70")

(string=? "A" "a")
(string=? "abacate" "abacate")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(not #true)

(not #false)

(and #true #true)

(or #true #false)

(and (= 1 2) (< 2 3))

;; (and (= x y) (< x y))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; is-5? : Number -> Bool
;; Obj: Dado um número, verifica se ele é 5
;; Exemplos:
;; (is-5? 5) = #true
;; (is-5? 3) = #false
(define (is-5? n)
  (= n 5))
;;Testes:
(check-expect (is-5? 5) #true)
(check-expect (is-5? -5) #false)
(check-expect (is-5? 9) #false)

;; entre-5-e-6? : Numero -> Numero
;; Obj: Dado um número, verifica se ele está entre 5 e 6 (exclusivo)
;; Exemplos:
;; (entre-5-e-6? 5) = #false
;; (entre-5-e-6? 5.5) = #true
;; (entre-5-e-6? 6) = #false
;; (entre-5-e-6? 0) = #false
;; (entre-5-e-6? 5.99) = #true
(define (entre-5-e-6? numero)
  (and 
   (> numero 5)
   (< numero 6)))
;; Testes:
(check-expect (entre-5-e-6? 5) #false)
(check-expect (entre-5-e-6? 5.5) #true)
(check-expect (entre-5-e-6? 6) #false)
(check-expect (entre-5-e-6? 0) #false)
(check-expect (entre-5-e-6? 5.99) #true)

(entre-5-e-6? pi)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; celcius->fahrenheit(temp) = (temp * 1.8) + 32
(define (celcius->fahrenheit temp)
  (+ (* temp 1.8) 32)
  )

;;(define (celcius->fahrenheit-text temp)
;;  (string-append 
;;   (number->string temp)
;;   "ºC são "
;;   (number->string (celcius->fahrenheit temp))
;;   "ºF.")
;;   )

(define (celcius->fahrenheit-text temp)
  (string-append 
   (number->string temp)
   (cond
     [(= temp 1) "ºC é "]
     [else "ºC são "]
     )
   (number->string (celcius->fahrenheit temp))
   "ºF.")
   )

(celcius->fahrenheit-text 0)
(celcius->fahrenheit-text 1)
(celcius->fahrenheit-text 37)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Conhecimento proibido
;; (if (positive? -5) ":)" (error "doesn't get here"))
(if (positive? 5) ":)" (error "doesn't get here"))

;;;;;;

(cond
  [(positive? 5) ":)"]
  [else (error "doesn't get here")]
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; dobroOUtriplo : Numero -> Numero
;; Obj: Dado um número, se ele for maior que 10 devolve o seu dobro, senão, devolve o seu triplo
;; Exemplos:
;; (dobroOUtriplo 10) = 30
;; (dobroOUtriplo 12) = 24
;; (dobroOUtriplo -8) = -24
;; (dobroOUtriplo 0) = 0
(define (dobroOUtriplo n)
  (cond
    [(> n 10) (* 2 n)]
    [(<= n 10) (* 3 n)])
  )
;; Testes:
(check-expect (dobroOUtriplo 10) 30)
(check-expect (dobroOUtriplo 12) 24)
(check-expect (dobroOUtriplo -8) -24)
(check-expect (dobroOUtriplo 0) 0)

(dobroOUtriplo pi)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; taxa-juros : Número -> Número
;; Obj: Dado um valor de depósito, calcula a taxa de juros, que pode ser 4% para depósitos até R$1000 (inclusive), 4.5% para depósitos entre R$1000 (exclusivo) e R$5000 (inclusive) e 5% para depósitos de mais de R$5000 (exclusivo). 
;; Exemplos:
;; (taxa-juros 1000) = 0.04
;; (taxa-juros 5000) = 0.045
;; (taxa-juros 10000) = 0.05
;; (taxa-juros 245) = 0.04
(define (taxa-juros valor)
  (cond 
    ;; se o valor for menor que R$1000, devolver 0.04
    [(<= valor 1000) 0.04]
    ;; se o valor estiver entre R$1000 e R$5000, devolver 0.045
    [(and (> valor 1000) (<= valor 5000)) 0.045]
    ;; se o valor for maior que R$5000, devolver 0.05
    [(> valor 5000) 0.05]
    ;; [else 0.05]
    ))
;; Testes:
(check-expect (taxa-juros 1000) 0.04)
(check-expect (taxa-juros 5000) 0.045)
(check-expect (taxa-juros 10000) 0.05)
(check-expect (taxa-juros 245) 0.04)


;; Essa opção abaixo não é tão boa pois apesar de calcular a mesma "coisa", a condição está "escondendo" parte do teste. Se a ordem das condições fosse alterada a função poderia dar o resultado errado, por exemplo.
(define (taxa-juros-B valor)
  (cond 
    ;; se o valor for menor que R$1000, devolver 0.04
    [(<= valor 1000) 0.04]
    ;; se o valor estiver entre R$1000 e R$5000, devolver 0.045
    [(<= valor 5000) 0.045]
    ;; se o valor for maior que R$5000, devolver 0.05
    [(> valor 5000) 0.05]
    ;; [else 0.05]
    ))
;; Testes:
(check-expect (taxa-juros-B 1000) 0.04)
(check-expect (taxa-juros-B 5000) 0.045)
(check-expect (taxa-juros-B 10000) 0.05)
(check-expect (taxa-juros-B 245) 0.04)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; f : Número -> Número
;; f(n) = 2*n, se n = 1
;;      = 2*(n-1), se n > 2
;;      = 2*(n-2), caso contrário
;;
;;
;; fA : Número → Número
(define (fA n) 
     (cond
       [(= n 1) (* 2 n)]
       [(> n 2) (* 2 (- n 1))]
       [else (* 2 (- n 2))]
       )
  )
;; Testes:
(check-expect (fA 1) 2)
(check-expect (fA 2) 0)
(check-expect (fA 1000) 1998)
(check-expect (fA 0) -4)
(check-expect (fA -1) -6)
(check-expect (fA 1/2) -3)
;;
;; fB : Número → Número
(define (fB n) 
  (* 2
     (cond
       [(= n 1) n]
       [(> n 2) (- n 1)]
       [else (- n 2)]
       )
     )
  )
;; Testes:
(check-expect (fB 1) 2)
(check-expect (fB 2) 0)
(check-expect (fB 1000) 1998)
(check-expect (fB 0) -4)
(check-expect (fB -1) -6)
(check-expect (fB 1/2) -3)