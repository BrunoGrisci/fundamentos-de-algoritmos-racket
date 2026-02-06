;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula22) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides da Prof. Leila Ribeiro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://www.youtube.com/watch?v=MFEC67hgobA&ab_channel=LeilaRibeiro

;; Na função de exemplo abaixo, definimos Delta localmente para não precisar reescrever a expressão que calcula o Delta toda vez que for necessário na Expressão da função raízes.

;; Veja que fora do escopo de raízes, delimitado por (define (raízes a b c) ...), não é possível chamar Delta.

;; raízes : Número Número Número -> Lista-de-números
;; Dados os coeficientes de uma equação do segundo grau, devolve as raízes
;; Exemplos: ...

(define (raízes a b c)
  (local ;; Definir Delta
   ( (define Delta (- (sqr b) (* 4 a c)) ) ) ;; Definição local
   (cond ;; Expressão
    ;; Se Delta é menor que zero, devolver a lista vazia (não tem raizes).
    [(< Delta 0) empty]
    ;; Se Delta é igual a zero, devolver uma lista com raiz única.
    [(= Delta 0) (list (/ (- 0 b) (* 2 a)))]
    ;; Se Delta é maior que zero, devolver a lista com as duas raízes.
    [(> Delta 0) (list
                  (/ (+ (- 0 b) (sqrt Delta)) (* 2 a))
                  (/ (- (- 0 b) (sqrt Delta)) (* 2 a)))]
    )
   )
  )

(raízes 2 4 -6)

;; (Delta 2 4 -6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Na função abaixo, adicionamos mais funções locais para chamadas de função que acontecem de forma repetida no código.

;; raízes2 : Número Número Número -> Lista-de-números
;; Dados os coeficientes de uma equação do segundo grau, devolve as raízes
;; Exemplos: ...

(define (raízes2 a b c)
  (local ;; Definir Delta
   ( (define Delta (- (sqr b) (* 4 a c)) ) 
     (define menosB (- 0 b)) 
     (define doisA (* 2 a))) ;; Definições locais
   (cond ;; Expressão
    ;; Se Delta é menor que zero, devolver a lista vazia (não tem raizes).
    [(< Delta 0) empty]
    ;; Se Delta é igual a zero, devolver uma lista com raiz única.
    [(= Delta 0) (list (/ menosB doisA))]
    ;; Se Delta é maior que zero, devolver a lista com as duas raízes.
    [(> Delta 0) (list
                  (/ (+ menosB (sqrt Delta)) doisA)
                  (/ (- menosB (sqrt Delta)) doisA))]
    )
   )
  )

(raízes2 2 4 -6)

;; (Delta 2 4 -6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Exemplo 1

(define x 1)
(define y 3)
(define w
  (local 
   ( (define x 10)
     (define y 20) ) 
   (+ x y)))

(define v (+ x y w))

v

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Exemplo 2

(define y1 1) 
(+ y1 
   (local 
    ( (define y1 10)
      (define z1 (+ y1 y1)) )
    z1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Exemplo 3

;; soma: Número Número -> Número

(define (soma x y)
  (local 
   ( 
    (define (soma-primeiro n)
      (+ x n))
    )
   (soma-primeiro y)))

(soma 2 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Exemplo 4

;; h: Número -> Lista-de-números
(define (h n)
  (cond
   [(= n 0) empty]
   [else (local 
          ((define r (* n n)) )
          (cons r (h (- n 1))))]
   )
  )

(h 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
