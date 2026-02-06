;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula24) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides da Prof. Leila Ribeiro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://www.youtube.com/watch?v=x1FwLc8kPoE&ab_channel=LeilaRibeiro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 2htdp/image)

;; Uma ListaDeNúmeros pode ser
;; 1. vazia (empty), ou
;; 2. (cons e l) , onde
;; e : Número
;; l : ListaDeNúmeros

;; maiores: ListaDeNúmeros Número -> ListaDeNúmeros
;; Dados um numero e uma lista de números, devolve todos os elementos da lista maiores que este número.
;; Exemplo: 
;; (maiores (list 11 14 7) 8) = (list 11 14)
(define (maiores lista n)
  (cond
   [(empty? lista) empty]
   [(> (first lista) n) (cons (first lista) (maiores (rest lista) n))]
   [else (maiores (rest lista) n)]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; menores: ListaDeNúmeros Número -> ListaDeNúmeros
;; Dados um numero e uma lista de números, devolve todos os elementos da lista menores que este número.
;; Exemplo: 
;; (maiores (list 11 14 7) 8) = (list 7)
(define (menores lista n)
  (cond
   [(empty? lista) empty]
   [(< (first lista) n) (cons (first lista) (menores (rest lista) n))]
   [else (menores (rest lista) n)]))

;; Daria para usar filter?

(let ((first (car (list 7 5 1 6 9 8 12 854 -8 4 0 9)))) ; get the first element
        (filter (lambda (x) (> x first)) (cdr (list 7 5 1 6 9 8 12 854 -8 4 0 9)))) ; filter elements larger than the first

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; _quicksort: ListaDeNúmeros -> ListaDeNúmeros
;; Dada uma lista de números, ordenar a lista em ordem crescente.
;; Exemplo: 
;; (_quicksort (list 11 8 14 7)) = (list 7 8 11 14)
(define (_quicksort l)
  (cond
   ;; Se a lista l estiver vazia, retornar a própria lista vazia.
   [(empty? l) empty]
   ;; Senão
   [else ;; Juntar as seguintes listas:
    (append
     ;; a lista ordenada dos elementos da lista l menores que o primeiro
     (_quicksort (menores l (first l)))
     ;; a lista que contém somente o primeiro elemento da lista
     (list (first l))
     ;; a lista ordenada dos elementos da lista l maiores que o primeiro
     (_quicksort (maiores l (first l)))
     )
    ]
   )
  )

(_quicksort (list 7 5 1 6 9 8 12 854 -8 4 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(_quicksort (list 7 5 1 6 9 8 12 854 -8 4 0 9)) ;; O que deu errado?

;; Usar >= resolveria?

;; iguais: ListaDeNúmeros Número -> ListaDeNúmeros
;; Dados um numero e uma lista de números, devolve todos os elementos da lista iguais a este número.
;; Exemplo: 
;; (iguais (list 11 14 7 14) 8) = emtpy
;; (iguais (list 11 14 7 14) 14) = (list 14 14)
(define (iguais lista n)
  (cond
   [(empty? lista) empty]
   [(= (first lista) n) (cons (first lista) (iguais (rest lista) n))]
   [else (iguais (rest lista) n)]))

(define (_quicksortREP l)
  (cond
   ;; Se a lista l estiver vazia, retornar a própria lista vazia.
   [(empty? l) empty]
   ;; Senão
   [else ;; Juntar as seguintes listas:
    (append
     ;; a lista ordenada dos elementos da lista l menores que o primeiro
     (_quicksortREP (menores l (first l)))
     ;; a lista que contém somente o primeiro elemento da lista
     (list (first l))
     (iguais (rest l) (first l))
     ;; a lista ordenada dos elementos da lista l maiores que o primeiro
     (_quicksortREP (maiores l (first l)))
     )
    ]
   )
  )

(_quicksortREP (list 7 5 1 6 9 8 12 854 -8 4 0))
(_quicksortREP (list 7 5 1 6 9 8 12 854 -8 4 0 9))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Definida na linguagem:

(quicksort (list 7 5 1 6 9 8 12 854 -8 4 0 9) <)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct bola (x y incr-x incr-y cor raio))
;; Um elemento do conjunto Bola é
;; (make-bola x y ix iy c r)
;; onde:
;; x : Número, representa a posição no eixo x da bola
;; y : Número, representa a posição no eixo y da bola
;; ix : Número, representa o deslocamento no eixo x da bola
;; iy : Número, representa o deslocamento no eixo y da bola
;; c : String, representa a cor da bola
;; r : Número, representa o raio da bola

(define B1 (make-bola 10 20 5 7 "red" 10))
(define B2 (make-bola 15 27 5 7 "red" 10))
(define B3 (make-bola 0 0 2 1 "blue" 20))

(define LARG 400)
(define ALT 400)

;; Uma Cena (Scene) pode ser
;; 1. vazia (empty-scene larg alt), onde
;;  larg : Número
;;   alt : Número
;; ou
;; 2. (place-image img x y cena) , onde
;;   img : Imagem
;;     x : Número
;;     y : Número
;;   cena: Cena

;; Uma ListaDeCenas pode ser
;; 1. vazia (empty), ou
;; 2. (cons e l) , onde
;; e : Cena
;; l : ListaDeCenas

;; desenha-cena: Bola -> Cena
;; Dada uma bola, desenha uma cena com esta bola.
;; Exemplo: (desenha-cena B1) = ...
(define (desenha-cena uma-bola)
  (place-image
   (circle (bola-raio uma-bola) "solid" (bola-cor uma-bola))
   (bola-x uma-bola)
   (bola-y uma-bola)
   (empty-scene LARG ALT)))

;; fora-dos-limites?: Bola -> Boolean
;; Dada uma bola, verifica se ela está dentro dos limites da mesa.
;; Exemplos:
;; (fora-dos-limites? B1) = #false
;; (fora-dos-limites? (make-bola -10 -10 5 7 "red" 5) ) = #true
(define (fora-dos-limites? uma-bola)
  (not
   (and 
    ;; a coordenada x da uma-bola está entre 0 e LARG
    (<= 0 (bola-x uma-bola) LARG)
    ;; a coordenada y da uma-bola está entre 0 e ALT
    (<= 0 (bola-y uma-bola) ALT))))

;; move-bola: Bola -> Bola
;; Dada uma bola, move esta bola de acordo com a definição do seu deslocamento.
;; Exemplos:
;; (move-bola B1) = B2
;; (move-bola (make-bola10 10 3 4 "green" 20)) = (make-bola 13 14 3 4 "green" 20)
(define (move-bola uma-bola)
  (make-bola
   (+ (bola-x uma-bola) (bola-incr-x uma-bola))
   (+ (bola-y uma-bola) (bola-incr-y uma-bola))
   (bola-incr-x uma-bola)
   (bola-incr-y uma-bola)
   (bola-cor uma-bola)
   (bola-raio uma-bola)))

;; move-até-que-fora: Bola -> ListaDeCenas
;; Dada uma bola, gerar a lista de cenas com o deslocamento da bola até que ela fique fora dos limites.
;; Exemplo: ...
(define (move-até-que-fora b)
  (cond
   ;; Se a bola b estiver fora dos limites, retornar a lista de cenas vazia.
   [(fora-dos-limites? b) empty]
   ;; Senão,
   [else ;; montar uma lista com as seguintes cenas
    (cons
     ;; o primeiro elemento é a cena com a bola b
     (desenha-cena b)
     ;; as cenas geradas pela movimentação da bola b deslocada
     (move-até-que-fora (move-bola b)))
    ]
   )
  )

;;(run-movie 0.05 (move-até-que-fora B1))
;;(run-movie 0.05 (move-até-que-fora B3))
(move-até-que-fora B1)




