;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula23) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides da Prof. Leila Ribeiro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://www.youtube.com/watch?v=mbYWtV0HDbA&ab_channel=LeilaRibeiro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct carta
  (numero ;; Numero entre 0 e 13
   naipe ;; String: "copas", "ouros", "paus", "espadas", "joker"
   ))

(define AS 1)
(define VALETE 11)
(define DAMA 12)
(define REI 13)

(define JOKER "joker")
(define COPAS "copas")
(define OUROS "ouros")
(define PAUS "paus")
(define ESPADAS "espadas")

(define as-copas (make-carta AS COPAS))
(define coringa (make-carta 0 JOKER))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Uma PilhaDeCartas pode ser
;;1. vazia (empty) ou
;;2. (cons c l), onde
;;   c: Carta
;;   l: PilhaDeCartas
;;

(define BARALHO (list as-copas))
(define BARALHO2 (list (make-carta 5 ESPADAS) (make-carta 7 PAUS) (make-carta 1 OUROS)))
(define BARALHO3 (list (make-carta 5 OUROS) (make-carta 7 PAUS) (make-carta 1 OUROS)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; éOuros? : Carta -> Booleano
;; Dada uma carta, diz se é de naipe ouros
;;Exemplos: ...
(define (éOuros? carta)
  (string=? (carta-naipe carta) OUROS))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; filtraOuros: PilhaDeCartas -> PilhaDeCartas
;; Dada uma pilha de cartas, remover as cartas de Ouros
;; Exemplos: ...
(define (filtraOuros p)
  (cond
    ;; Se a pilha p está vazia, devolver empty.
    [(empty? p) empty]
    ;; Se a primeira carta da pilha p é de Ouros,
    ;; construir uma pilha sem ela
    [(éOuros? (first p)) (filtraOuros (rest p))]
    ;; Senão, construir uma pilha com a primeira carta de p
    ;; e substituir as cartas de Ouros do resto da pilha p
    [else (cons (first p) (filtraOuros (rest p)))]
    )
  )

BARALHO
(filtraOuros BARALHO)
BARALHO2
(filtraOuros BARALHO2)
BARALHO3
(filtraOuros BARALHO3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; éNaipe? : Carta String -> Booleano
;; Dada uma carta, diz se é do naipe
;; Exemplos: ...
(define (éNaipe? carta n)
  (string=? (carta-naipe carta) n))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; filtraNaipe: PilhaDeCartas String -> PilhaDeCartas
;; Dada uma pilha de cartas e um naipe, remover as cartas desse naipe
;; Exemplos: ...
(define (filtraNaipe p n)
  (cond
    ;; Se a pilha p está vazia, devolver empty.
    [(empty? p) empty]
    ;; Se a primeira carta da pilha p é do naipe n,
    ;; construir uma pilha sem ela
    [(éNaipe? (first p) n) (filtraNaipe (rest p) n)]
    ;; Senão, construir uma pilha com a primeira carta de p
    ;; e substituir as cartas de Ouros do resto da pilha p
    [else (cons (first p) (filtraNaipe (rest p) n))]
    )
  )

BARALHO
(filtraNaipe BARALHO PAUS)
BARALHO2
(filtraNaipe BARALHO2 PAUS)
BARALHO3
(filtraNaipe BARALHO3 PAUS)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; filtra: PilhaDeCartas (Carta -> Booleano) -> PilhaDeCartas
;; Dada uma pilha de cartas e um critério, filtrar as cartas conforme o critério.
;; Exemplos: ...
(define (filtra p criterio)
  (cond
    ;; Se a pilha p está vazia, devolver empty.
    [(empty? p) empty]
    ;; Se a primeira carta da pilha p atende ao critério,
    ;; construir uma pilha com ela
    [(criterio (first p)) 
     (cons (first p)
           (filtra (rest p) criterio))]
    ;; Senão, devolver as cartas no critério do resto da pilha p
    [else (filtra (rest p) criterio)]
    )
  )

BARALHO
(filtra BARALHO éOuros?)
BARALHO2
(filtra BARALHO2 éOuros?)
BARALHO3
(filtra BARALHO3 éOuros?)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Exercício: crie uma função de alta ordem calculadora que realize operações aritméticas sobre um par de números.

;; calculadora: Número Número (Número -> Número) -> Número
;; Dados dois números e uma operação sobre eles, efetuar esta operação.
;; Exemplos:
;; (calculadora 2 3 +) = 5
;; (calculadora 4 1 -) = 3
(define (calculadora n1 n2 operacao)
  (operacao n1 n2))

(calculadora 2 3 +)
(calculadora 5 2 /)
(calculadora 2 3 max)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(filter negative? (list 2 4 -1 -5 10)) ;; = (list -1 -5)
(filter number? (list 3 "A" true 0 -1 "B")) ;; = (list 3 0 -1)

(map sqr (list 2 4 -1 -5 10)) ;;; = (list 4 16 1 25 100)
(map number? (list 3 "A" true 0 -1 "B")) ;; = (list #true #false #false #true #true #false)

(foldl + 0 (list 1 2 3 4)) ;; = 10
(foldl max 0 (list 23 2 -1 30 7 18)) ;; = 30
(foldl string-append "*" (list "A" "B" "C")) ;; = "CBA*"
(foldl cons empty (list 1 2 3 4)) ;; = (list 4 3 2 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Expressões Lambda

;; Função nomeada:
(define (soma1 x)
  (+ x 1))
(soma1 2)

;; Função anônima:
(lambda (x) (+ x 1))
((lambda (x) (+ x 1)) 2)

(filter (lambda (x) (> x 3)) (list 2 4 -1 -5 10))




