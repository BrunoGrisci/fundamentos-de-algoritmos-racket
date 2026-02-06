;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname prova02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; menor : Lista-de-números -> Número
;; Determina o menor de uma lista não vazia de números
(define (menor ldn)
   (cond
    [( empty? (rest ldn )) (first ldn )]
    [else (
           local (
                  (define menor-do-resto (menor (rest ldn ))) 
                  )
                 (cond
                  [(< menor-do-resto (first ldn)) menor-do-resto ]
                  [else (first ldn )]))]))
;; Teste:
;; (menor (list 0 1 2 3)) = 0

(define (fun x y)
  (cond
    [(empty? x) "#"]
    [else (y (fun (rest x) y) (first x))]
   )
  )



(fun (list "terminou" "a" "prova") string-append)



(define-struct herdeiro (nome patrimonio pai mae))
;; Um elemento do conjunto Herdeiro tem o formato
;;      (make-herdeiro n v p m)
;; onde:
;;       n : String, representa o nome do herdeiro
;;       v : Número, representa o patrimônio do herdeiro acumulado em vida sem considerar heranças
;;       p : Herdeiro, representa o pai do herdeiro
;;       m : Herdeiro, representa a mãe do herdeiro
;;
;; Um elemento do conjunto Herdeiro pode ser
;; 1. empty, representando a falta de informação
;; 2. (make-herdeiro n v p m)

(define (total-patrimonio herdeiro imposto)
  (cond
    [(empty? herdeiro) 0]  ;; If there's no information (empty), return 0
    [else
      (+ (herdeiro-patrimonio herdeiro)  ;; Add the heir's own wealth
         (* (total-patrimonio (herdeiro-pai herdeiro) imposto) (- 1.0 imposto))  ;; Add half of the father's total wealth
         (* (total-patrimonio (herdeiro-mae herdeiro) imposto) (- 1.0 imposto)))]))  ;; Add half of the mother's total wealth

(define AVÔ-PATERNO (make-herdeiro "Avô Paterno" 100000 empty empty))
(define AVÓ-PATERNA (make-herdeiro "Avó Paterna" 80000 empty empty))
(define AVÓ-MATERNA (make-herdeiro "Avó Materna" 90000 empty empty))

(define PAI (make-herdeiro "Pai" 50000 AVÔ-PATERNO AVÓ-PATERNA))
(define MAE (make-herdeiro "Mãe" 60000 empty AVÓ-MATERNA))

(define FILHO (make-herdeiro "Filho" 20000 PAI MAE))

(total-patrimonio empty 0.3)
(total-patrimonio MAE 0.1)


(define LISTA (list 23 2 -1 30 7 18))


(foldl max 0 LISTA) ;; = 30

(foldl cons empty LISTA) ;; = (list 18 7 30 -1 2 23)

(map (lambda (x) (> x 10)) LISTA) ;; (list true false false true false true)

(filter (lambda (x) (> x 10)) LISTA) ;; (list 23 30 18)

(filter string? LISTA) ;; empty

;;(map string-length LISTA) ;; Erro

30
(list 18 7 30 -1 2 23)
(list true false false true false true)
(list 23 30 18)
empty
;;Retorna erro

23
2
-1
7
18
(list "23" "2" "-1" "30" "7" "18")
(list 23 2 -1 30 7 18)
(list 2 1 2 2 1 2)
6
79

;; menor: Lista-de-números -> Número
;; Determina o menor de uma lista não vazia de números
(define (menor0 ldn)
  (begin
   (display "Chamando menor com ldn = ") (display ldn) (newline) 
   (cond
    [(empty? (rest ldn )) (first ldn )]
    [else
     (cond
      [(> (menor0 (rest ldn )) (first ldn )) (menor0 (rest ldn ))]
      [else (first ldn )])])))

(menor0 (list 0 1 2 3))

;; menor : Lista-de-números -> Número
;; Determina o menor de uma lista não vazia de números
(define (menor ldn)
   (cond
    [( empty? (rest ldn )) (first ldn )]
    [else (
           local (
                  (define menor-do-resto (menor (rest ldn ))) 
                  )
                 (cond
                  [(< menor-do-resto (first ldn)) menor-do-resto ]
                  [else (first ldn )]))]))
;; Teste:
;; (menor (list 0 1 2 3)) = 0






(define (testa-soma x y z)
(local (
;; soma: ................................... --> ..........................
;; exemplos:
;; ........................................................................
;; ........................................................................
(define (soma i nivel)
(begin
   (display "x, y, i, nivel:") (display x) (display y) (display i) (display nivel) (newline)   
  (cond
   [(or (> x y) (< x 1) (< y 1)) 'ArgumentosInvalidos]
   [(= i y) i]
   [(= nivel 1) (+ (soma i 2) (soma (+ i 1) 1))]
   [else (+ i (soma (+ i 1) 2))]
   )
 )
  )
  
        (define SOMA (soma x 1))
        
       (cond
        [(symbol? SOMA) SOMA]
        [(> SOMA z) 'Maior]
        [(< SOMA z) 'Menor]
        [(= SOMA z) SOMA]
        )
       )
       )
  )
       

