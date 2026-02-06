;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides da Prof. Leila Ribeiro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ÁRVORES

(define-struct pessoa (nome ano origem pai mãe))
;; Um elemento do conjunto Pessoa tem o formato
;;      (make-pessoa n a o p m)
;; onde:
;;       n : String, representa o nome da pessoa
;;       a : Número, representa o ano de nascimento da pessoa
;;       o : String, representa o país de origem da pessoa
;;       p : Pessoa, representa o pai da pessoa
;;       m : Pessoa, representa a mãe da pessoa
;; Mas e se eu não conheço o pai ou a mãe?
;;
;; Um elemento do conjunto Pessoa pode ser
;; 1. empty , representando a falta de informação, ou
;;    poderia ser 0, poderia ser "?", etc.
;; 2. (make-pessoa n a o p m)
;; onde:
;;     n : String, representa o nome da pessoa
;;     a : Número, representa o ano de nascimento da pessoa
;;     o : String, representa o país de origem da pessoa
;;     p : Pessoa, representa o pai da pessoa
;;     m : Pessoa, representa a mãe da pessoa


(make-pessoa "Gustavo" 1988 "Brasil"
             (make-pessoa "Fred" 1958 "Argentina" empty empty)
             (make-pessoa "Eva" 1960 "Brasil"
                          (make-pessoa "Carlos" 1926 "Itália" empty empty)
                          (make-pessoa "Betina" 1927 "Brasil" empty empty)))

(define CARLOS (make-pessoa "Carlos" 1926 "Itália" empty empty))
(define BETINA (make-pessoa "Betina" 1927 "Brasil" empty empty))
(define EVA (make-pessoa "Eva" 1960 "Brasil" CARLOS BETINA))
(define FRED (make-pessoa "Fred" 1958 "Argentina" empty empty))
(define GUSTAVO (make-pessoa "Gustavo" 1988 "Brasil" FRED EVA))

;; Ancestral argentino?
;; Nome? ancestralArgentino?
;; Entrada? Pessoa
;; Saída? Booleano
;; Exemplos?
;; (ancestralArgentino? GUSTAVO) = #true
;; (ancestralArgentino? EVA) = #false 

(define (ancestralArgentino? p)
  (cond
    ;; Se p é empty, devolver false.
    [(empty? p) #false]
    ;; Se p é argentino, devolver true.
    [(string=? (pessoa-origem p) "Argentina") #true]
    ;; Senão, existe ancestral argentino se
    [else
       ;;OU
       (or
        ;; Existe alguém argentino entre os ancestrais por parte de mãe
        (ancestralArgentino? (pessoa-mãe p))
        ;; Existe alguém argentino entre os ancestrais por parte de pai
        (ancestralArgentino? (pessoa-pai p)))]
    )
  )

(ancestralArgentino? GUSTAVO)
(ancestralArgentino? EVA)
(ancestralArgentino? FRED)

;; EXERCÍCIO: adapte o código acima para que uma pessoa não possa ser considerada como ancestral de si mesma

(define (ancestralArgentinoEstrito? p)
  (cond
    [(and
      (empty? (pessoa-mãe p))
      (empty? (pessoa-pai p))
     ) #false]
    [(string=? (pessoa-origem (pessoa-mãe p)) "Argentina") #true]
    [(string=? (pessoa-origem (pessoa-pai p)) "Argentina") #true]
    [else
       ;;OU
       (or
        (ancestralArgentinoEstrito? (pessoa-mãe p))
        (ancestralArgentinoEstrito? (pessoa-pai p)))]
    )
  )

(ancestralArgentinoEstrito? GUSTAVO)
(ancestralArgentinoEstrito? EVA)
(ancestralArgentinoEstrito? FRED)

(define-struct nó (id conteúdo esq dir))
;; Um elemento do conjunto AB (Árvore Binária) pode ser
;; 1. empty , representando a falta de informação, ou
;; 2. (make-nó id c e d)
;; onde:
;;     id : Número, representa o identificador do nó
;;      c : String, representa o conteúdo do nó
;;      e : AB, representa a sub-árvore da esquerda
;;      d : AB, representa a sub-árvore da direita

(make-nó 10 "A"
         (make-nó 12 "B" empty empty)
         (make-nó 3 "C"
                  (make-nó 15 "D"
                           (make-nó 1 "F" empty empty)
                           empty)
                  (make-nó 20 "E" empty empty)))

;; EXERCÍCIO: Construa uma função que, dada uma árvore binária, retorna uma lista com os identificadores (ids) dos nós da árvore.


(list 1 2 3 4)
(define L (list 1 2 3 4))
(append L (list 3 4))
(append L (list 3 4) (list 5 6) (list 7 8))

(list? L)
(length L)
(first L)
(rest L)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (define-struct nó (id conteúdo esq dir))
;; Um elemento do conjunto ABP (Árvore Binária de Pesquisa) pode ser
;; 1. empty , representando a falta de informação, ou
;; 2. (make-nó id c e d)
;; onde:
;;     id : Número, representa o identificador do nó
;;      c : String, representa o conteúdo do nó
;;      e : ABP, representa a sub-árvore da esquerda e contém apenas nós com identificadores menores que id
;;      d : ABP, representa a sub-árvore da direita contém apenas nós com identificadores maiores que id

;; Entrada? ListaPar
;; Saída? ABP

(define-struct par (id cont))
;; Um elemento do conjunto Par tem o formato
;;    (make-par id c), onde:
;;    id : Número, representa o id
;;     c : String, representa um conteúdo
;; Uma ListaPar é
;; 1. empty, ou
;; 2. (cons p lp), onde p: Par e lp: ListaPar

(define L1 (list (make-par 11 "F") (make-par 20 "E") (make-par 3 "B") (make-par 15 "D") (make-par 17 "B") (make-par 10 "A")))

L1

;; constróiABP: ListaPar -> ABP
;; Dada uma lista de pares de identificador e conteúdo, gera uma ABP com estes pares..
;; Exemplo:
;; (constróiABP empty) = empty
;; (constrói ABP L1) = (make-nó 10 "A"
;;                         (make-nó 3 "B" empty empty)
;;                         (make-nó 17"C"
;;                             (make-nó 15 "D"
;;                                (make-nó 11 "F" empty empty)
;;                              empty)
;;                        (make-nó 20 "E" empty empty)))


;; insere-nó: Número String ABP -> ABP
;; Dados um identificador, um conteúdo e uma ABP, insere um nó com este identificador e conteúdo na ABP.
;; Exemplo:
;; (insere-nó 20 "E" empty) = (make-nó 20 "E" empty empty)
;; outros exemplos...

(define (insere-nó id cont abp)
  (cond
    [(empty? abp) (make-nó id cont empty empty)]
    [(> id (nó-id abp))
        (make-nó ;; ABP construída inserindo o nó com id, cont na subárvore da direita de abp
                 (nó-id abp) ;; id da raiz da ABP
                 (nó-conteúdo abp) ;; conteúdo da raiz da ABP
                 (nó-esq abp) ;; subárvore da esquerda da ABP
                 (insere-nó id cont (nó-dir abp)))] ;; nova subárvore da direita da ABP
    [(< id (nó-id abp))
        (make-nó ;; ABP construída inserindo o nó com id, cont na subárvore da esquerda de abp
                 (nó-id abp) ;; id da raiz da ABP
                 (nó-conteúdo abp) ;; conteúdo da raiz da ABP
                 (insere-nó id cont (nó-esq abp)) ;; nova subárvore da esquerda da ABP
                 (nó-dir abp))])) ;; subárvore da direita da ABP

(insere-nó 20 "E" empty)

;; constróiABP: ListaPar -> ABP
;; Dada uma lista de pares de identificador e conteúdo, gera uma ABP com estes pares.
(define (constróiABP lp)
  (cond
    [(empty? lp) empty]
    [else
     (insere-nó ;; inserir um nó com
                (par-id (first lp)) ;; o identificador do primeiro nó da lista
                (par-cont (first lp)) ;; o conteúdo do primeiro nó da lista
                (constróiABP (rest lp)))])) ;; na árvore com o resto dos pares da lista

(constróiABP L1)

;; EXERCÍCIO: Desenvolva uma função que, dados um identificador e uma árvore binária de pesquisa, retorna o conteúdo associado a este identificador na árvore. Se não houver nó com este identificador, retorna a mensagem "Nó não encontrado".


