;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname map_condicional) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;; Função map-condicional
;;; Esta função aplica a função f apenas aos elementos de uma lista para os quais a função criterio retorna verdadeiro (#true).

;;; map-condicional: (tipo1 -> tipo2) listadetipo1 (tipo1 -> Booleano) -> listadetipo2
;;; Argumentos:
;;;   f - uma função que será aplicada aos elementos da lista.
;;;   lst - uma lista contendo os elementos sobre os quais f será aplicada.
;;;   criterio - uma função condicional que retorna #true ou #false para cada elemento da lista.
;;; Retorno:
;;;   Uma nova lista onde f foi aplicada apenas aos elementos que satisfazem o criterio.
;;; Exemplos:
;;; (map-condicional sqr (list 1 2 3 4 5 6) (lambda (x) (= (modulo x 2) 0))) retorna (list 1 4 3 16 5 36)
;;; (map-condicional string-length (list "A" 1 "BC" 2 "DEF" 3) string?) retorna (list 1 1 2 2 3 3)

(define (map-condicional f lst criterio)
  (cond
    [(empty? lst) empty] ; Caso base: lista vazia
    [(criterio (first lst))
     (cons (f (first lst)) (map-condicional f (rest lst) criterio))] ; Aplica f se criterio retornar #true
    [else
     (cons (first lst) (map-condicional f (rest lst) criterio))])) ; Mantém o elemento caso contrário

;;; Casos de teste:

(check-expect (map-condicional sqr (list 1 2 3 4 5 6) (lambda (x) (= (modulo x 2) 0))) (list 1 4 3 16 5 36) )
(check-expect (map-condicional string-length (list "A" 1 "BC" 2 "DEF" 3) string?) (list 1 1 2 2 3 3) )
(check-expect (map-condicional string-length empty string?) empty )


