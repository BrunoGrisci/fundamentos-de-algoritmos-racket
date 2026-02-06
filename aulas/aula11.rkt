;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides da Prof. Leila Ribeiro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define CINCO-PRIMOS (cons 2 (cons 3 (cons 5 (cons 7 (cons 11 empty))))))

CINCO-PRIMOS

(first CINCO-PRIMOS)
(rest CINCO-PRIMOS)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Uma PilhaDeCartas pode ser
;;1. vazia (empty) ou
;;2. (cons c l), onde
;;   c: Carta
;;   l: PilhaDeCartas
;;
(define-struct carta
  (numero ;; Numero entre 1 e 13
   naipe ;; String: "copas", "ouros", "paus", "espadas"
   ))
;; Um elemento do conjunto Carta tem o formato
;; (make-carta n v)
;; onde:
;; n : String, representa o naipe da carta
;; v : Número, representa o valor da carta

(define AS 1)
(define VALETE 11)
(define DAMA 12)
(define REI 13)

(define COPAS "copas")
(define OUROS "ouros")
(define PAUS "paus")
(define ESPADAS "espadas")

(define AS-COPAS (make-carta AS COPAS))

(carta-numero AS-COPAS)
(carta-naipe AS-COPAS)


;;AsDeCopas? : Carta -> Booleano
;;Dada uma Carta, dizer se ela é o ás de copas
;;Exemplos...
(define (AsDeCopas? carta)
  (cond
    [(and 
      (= (carta-numero carta) AS)
      (string=? (carta-naipe carta) COPAS)) #true]
    [else #false]
    )
  )

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

(define BARALHO (cons AS-COPAS empty))
BARALHO

(temAsDeCopas? BARALHO)

(define BARALHO2 (cons (make-carta 5 ESPADAS) 
                      (cons (make-carta 7 PAUS)
                            (cons (make-carta AS OUROS)
                                  empty))))
BARALHO2
(temAsDeCopas? BARALHO2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; numeroDeCopasIncorreto : PilhaDeCartas -> Numero
;; Dado uma PilhaDeCartas, devolve quantas cartas tem naipe copas
;; Exemplos: ...
(define (numeroDeCopasIncorreto p)
  (cond
    ;;Se a pilha p está vazia, devolver 0 (não tem copas)
    [(empty? p) 0]
    ;;Se o primeiro elemento da pilha p é de copas, somar 1
    [(string=? (carta-naipe (first p)) COPAS) 1]
    [else (numeroDeCopasIncorreto (rest p))]
    )
  )

BARALHO
(numeroDeCopasIncorreto BARALHO)
BARALHO2
(numeroDeCopasIncorreto BARALHO2)

(define BARALHO3 (cons (make-carta 5 COPAS) 
                      (cons (make-carta 7 PAUS)
                            (cons (make-carta AS COPAS)
                                  empty))))

BARALHO3
(numeroDeCopasIncorreto BARALHO3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; numeroDeCopasCorreto : PilhaDeCartas Número -> Número
;; Dado uma PilhaDeCartas e contador igual a zero, devolve quantas cartas tem naipe copas
;; Exemplos: ...
(define (numeroDeCopasCorreto p contador)
  (cond
    ;;Se a pilha p está vazia, devolver 0 (não tem copas)
    [(empty? p) contador]
    ;;Se o primeiro elemento da pilha p é de copas, somar 1
    [(string=? (carta-naipe (first p)) COPAS) (numeroDeCopasCorreto (rest p) (+ 1 contador))]
    [else (numeroDeCopasCorreto (rest p) contador)]
    )
  )
BARALHO
(numeroDeCopasCorreto BARALHO 0)
BARALHO2
(numeroDeCopasCorreto BARALHO2 0)
BARALHO3
(numeroDeCopasCorreto BARALHO3 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; numeroDeCopasFinal : PilhaDeCartas -> Numero
;; Dado uma PilhaDeCartas, devolve quantas cartas tem naipe copas
;; Exemplos: ...
(define (numeroDeCopasFinal p)
  (cond
    ;;Se a pilha p está vazia, devolver 0 (não tem copas)
    [(empty? p) 0]
    ;;Se o primeiro elemento da pilha p é de copas, somar 1
    [(string=? (carta-naipe (first p)) COPAS) (+ 1 (numeroDeCopasFinal (rest p)))]
    [else (numeroDeCopasFinal (rest p))]
    )
  )

BARALHO
(numeroDeCopasFinal BARALHO)
BARALHO2
(numeroDeCopasFinal BARALHO2)
BARALHO3
(numeroDeCopasFinal BARALHO3)
