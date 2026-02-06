;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides da Prof. Leila Ribeiro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; LISTAS
;; É um objeto com uma estrutura interna, mas, diferente de uma estrutura:
;; possui tamanho indeterminado;
;; não se pode acessar qualquer elemento diretamente, somente o primeiro;
;; na maioria das vezes, usa-se lista quando se quer representar uma classe de elemento similares: vários números, vários alunos, etc...;
;; porém, diferente de um conjunto, existe uma ordem entre os elementos de uma lista.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Uma ListaDeNumeros pode ser
;;1. vazia (empty) ou
;;2. (cons n l), onde
;;   n: Numero
;;   l: ListaDeNumeros

(define ListaDeNumeros (cons 2 (cons 3 (cons 5 (cons 7 (cons 11 empty))))))

;; tamanho : Lista -> Numero
;; Dada uma lista de números, devolve o tamanho da lista (quantidade de elementos)
;; Exemplos: ...
(define (tamanho l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (tamanho (rest l)))]
   )
  )

ListaDeNumeros
(tamanho ListaDeNumeros)

;; soma : ListaDeNumeros -> Número
;; Dada uma lista de números, devolve a soma dos números da lista
;; Exemplos: ...
(define (soma l)
  (cond
   [(empty? l) 0]
   [else (+ (first l) (soma (rest l)))]
   )
  )

ListaDeNumeros
(soma ListaDeNumeros)
(soma (cons 0 (cons -50 (cons pi (cons 3 (cons 4 empty))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(carta-numero as-copas)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Uma PilhaDeCartas pode ser
;;1. vazia (empty) ou
;;2. (cons c l), onde
;;   c: Carta
;;   l: PilhaDeCartas
;;

(define BARALHO (cons as-copas empty))
(define BARALHO2 (cons (make-carta 5 ESPADAS) 
                      (cons (make-carta 7 PAUS)
                            (cons (make-carta 1 OUROS)
                                  empty))))
(define BARALHO3 (cons (make-carta 5 OUROS) 
                      (cons (make-carta 7 PAUS)
                            (cons (make-carta 1 OUROS)
                                  empty))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;AsDeCopas? : Carta -> Booleano
;;Dada uma Carta, dizer se ela é o ás de copas
;;Exemplos...
(define (AsDeCopas? carta)
  (cond
    [(and 
      (= (carta-numero carta) 1)
      (string=? (carta-naipe carta) COPAS)) #true]
    [else #false]
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;temAsDeCopas? : PilhaDeCartas -> Booleano
;;Dada uma pilha de cartas, dizer se ela possui um ás de copas
;;Exemplos: ...

(define (temAsDeCopas? p)
  (cond
    ;;Se a pilha p está vazia, devolver false (não tem ás de copas)
    [(empty? p) #false]
    ;;Se o primeiro elemento da pilha p é ás de copas, devolver true (tem ás de copas)
    [(AsDeCopas? (first p)) #true]
    ;;Senão, verificar se tem ás de copas no resto da pilha p
    [else (temAsDeCopas? (rest p))]
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; numeroDeCopas : PilhaDeCartas -> Numero
;; Dado uma PilhaDeCartas, devolve quantas cartas tem naipe copas
;; Exemplos: ...
(define (numeroDeCopas p)
  (cond
    ;;Se a pilha p está vazia, devolver 0 (não tem copas)
    [(empty? p) 0]
    ;;Se o primeiro elemento da pilha p é de copas, somar 1
    [(string=? (carta-naipe (first p)) COPAS) (+ 1 (numeroDeCopas (rest p)))]
    [else (numeroDeCopas (rest p))]
    )
  )

BARALHO
(numeroDeCopas BARALHO)
BARALHO2
(numeroDeCopas BARALHO2)
BARALHO3
(numeroDeCopas BARALHO3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; éOuros? : Carta -> Booleano
;; Dada uma carta, diz se é de naipe ouros
;;Exemplos: ...
(define (éOuros? carta)
  (string=? (carta-naipe carta) OUROS))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; substituiOuros: PilhaDeCartas -> PilhaDeCartas
;; Dada uma pilha de cartas, substituir as cartas de Ouros por jokers
;; Exemplos: ...
(define (substituiOuros p)
  (cond
    ;; Se a pilha p está vazia, devolver empty.
    [(empty? p) empty]
    ;; Se a primeira carta da pilha p é de Ouros,
    ;; construir uma pilha com um Joker
    ;; e substituir as cartas de Ouros do resto da pilha p
    [(éOuros? (first p)) 
     (cons coringa 
           (substituiOuros (rest p)))]
    ;; Senão, construir uma pilha com a primeira carta de p
    ;; e substituir as cartas de Ouros do resto da pilha p
    [else (cons (first p) (substituiOuros (rest p)))]
    )
  )

BARALHO
(substituiOuros BARALHO)
BARALHO2
(substituiOuros BARALHO2)
BARALHO3
(substituiOuros BARALHO3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; éNaipe? : Carta String -> Booleano
;; Dada uma carta, diz se é do naipe
;;Exemplos: ...
(define (éNaipe? carta n)
  (string=? (carta-naipe carta) n))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; filtra: PilhaDeCartas String -> PilhaDeCartas
;; Dada uma pilha de cartas e um naipe, remover as cartas desse naipe
;; Exemplos: ...
(define (filtra p n)
  (cond
    ;; Se a pilha p está vazia, devolver empty.
    [(empty? p) empty]
    ;; Se a primeira carta da pilha p é do naipe n,
    ;; construir uma pilha sem ela
    [(éNaipe? (first p) n) (filtra (rest p) n)]
    ;; Senão, construir uma pilha com a primeira carta de p
    ;; e substituir as cartas de Ouros do resto da pilha p
    [else (cons (first p) (filtra (rest p) n))]
    )
  )

BARALHO
(filtra BARALHO PAUS)
BARALHO2
(filtra BARALHO2 PAUS)
BARALHO3
(filtra BARALHO3 PAUS)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Exercício: faça uma função que dada uma pilha de cartas e um naipe, devolva a soma 
;; dos valores de todas as cartas na pilha que têm aquele naipe



