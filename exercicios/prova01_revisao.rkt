;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname prova01_revisao) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Prof. Bruno Iochins Grisci
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 1. (1 ponto) Construa uma função que, dado um número ou um string, devolve Válido se ele for um número e este número for 1, 2, 3 ou 4, e Inválido, caso contrário.

;; valida-numero : Numero ou String -> Símbolo
;; Obj: Esta função recebe um valor de qualquer tipo e devolve 'Válido se o valor for um número e este número for 1, 2, 3 ou 4. Caso contrário, devolve 'Inválido.
;; Testes:
;; (valida-numero 1) = 'Válido
;; (valida-numero 2) = 'Válido
;; (valida-numero 3) = 'Válido
;; (valida-numero 4) = 'Válido
;; (valida-numero 5) = 'Inválido
;; (valida-numero "2") = 'Inválido
;; (valida-numero 3.7) = 'Inválido

(define (valida-numero x)
  (cond
    [(not (number? x)) 'Inválido]
    [(or (= x 1) (= x 2) (= x 3) (= x 4)) 'Válido]
    [else 'Inválido]))

(check-expect (valida-numero 1) 'Válido)
(check-expect (valida-numero 2) 'Válido)
(check-expect (valida-numero 3) 'Válido)
(check-expect (valida-numero 4) 'Válido)
(check-expect (valida-numero 5) 'Inválido)
(check-expect (valida-numero "2") 'Inválido)
(check-expect (valida-numero 3.7) 'Inválido)
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 2. (6 pontos) Uma associação deseja fazer uma eleição para presidente. Existem 4 candidatos para presidente, que serão indicados pelos números 1, 2, 3 e 4. Cada eleitor pode votar em um candidato, votar nulo ou em branco. Votos em branco são idetificados pelo string "Branco", e votos nulos podem ser qualquer outro string ou número que não seja de um candidato.

;; (a) Escreva a definição de dados de um tipo de dados que contenha listas de votos.

; Um Voto é um dos seguintes:
; - um número 1, 2, 3 ou 4 representando um candidato
; - a string "Branco" representando um voto em branco
; - qualquer outro valor representando um voto nulo

; ListaVotos é uma lista de Voto
; empty representa uma lista vazia
; (cons Voto ListaVotos) representa uma lista de votos onde o primeiro elemento é um Voto e o restante é uma ListaVotos

(define votos-exemplo (cons 1 (cons 2 (cons 7 (cons 1 (cons 1 (cons "Branco" (cons 4 (cons "Branco" empty)))))))))
  
votos-exemplo

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (b) Escreva uma função que, dada uma lista de votos e um número, devolve a quantidade de votos do candidato com este número na lista de votos. Se o número de candidato passado como entrada para a função for diferente de 1, 2, 3 ou 4, devolver a mensagem "Candidato não existente!".

; Função para contar votos de um candidato específico
; count-votes : ListaVotos Número -> Número ou String
; Obj: Conta o número de votos para um candidato específico na ListaVotos.
; Devolve "Candidato não existente!" se o número do candidato não for 1, 2, 3 ou 4.

(define (count-votes votos candidato)
  (cond
    [(eq? (valida-numero candidato) 'Inválido) "Candidato não existente!"]
    [else (count-votes-helper votos candidato)]
   )
  )

; Função auxiliar para contar votos
(define (count-votes-helper votos candidato)
  (cond
    [(empty? votos) 0]
    [(not (number? (first votos))) (+ 0 (count-votes-helper (rest votos) candidato))]
    [(= (first votos) candidato) (+ 1 (count-votes-helper (rest votos) candidato))]
    [else (+ 0 (count-votes-helper (rest votos) candidato))]
   )
  )

(check-expect (count-votes votos-exemplo 1) 3)
(check-expect (count-votes votos-exemplo 2) 1)
(check-expect (count-votes votos-exemplo 3) 0)
(check-expect (count-votes votos-exemplo 4) 1)
(check-expect (count-votes votos-exemplo 5) "Candidato não existente!")
(check-expect (count-votes votos-exemplo "Branco") "Candidato não existente!")
(check-expect (count-votes votos-exemplo 3.5) "Candidato não existente!")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (c) Definir um tipo de dados para armazenar os dados do resultado da votação para um candidato. Cada registro de resultado deve conter o número do candidato e a sua quantidade de votos.

; Definindo uma estrutura para armazenar os resultados da votação para cada candidato
(define-struct resultado-votacao 
               (candidato1 
                candidato2 
                candidato3 
                candidato4)
               )

; Um ResultadoVotacao é uma estrutura:
; (resultado-votacao Número Número Número Número)
; onde cada número representa a quantidade de votos para os candidatos 1, 2, 3 e 4 respectivamente.

; Exemplo de uso
(define resultado-exemplo (make-resultado-votacao 10 20 15 5))

; Acesso aos campos da estrutura
(resultado-votacao-candidato1 resultado-exemplo) ; 10
(resultado-votacao-candidato2 resultado-exemplo) ; 20
(resultado-votacao-candidato3 resultado-exemplo) ; 15
(resultado-votacao-candidato4 resultado-exemplo) ; 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (d) Dar 2 exemplos de elementos do tipo de dados definido no item a).

(define votos-exemplo1 (cons 1 (cons 2 (cons 7 (cons 1 (cons 1 (cons "Branco" (cons 4 (cons "Branco" empty)))))))))
  
votos-exemplo1

(define votos-exemplo2 (cons 18 (cons 2 (cons 7 (cons 3 (cons 1 (cons "Branco" (cons 3 (cons "Branco" empty)))))))))
  
votos-exemplo2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (e) Desenvolva uma função que, dado um registro de resultado da votação, soma um à quantidade de votos, caso o número do candidato seja válido. Caso contrário, o registro fica inalterado.

; Função para incrementar os votos de um candidato, se o número for válido
; incrementa-voto : ResultadoVotacao Número -> ResultadoVotacao
; Obj: Recebe um registro de resultado da votação e um número de candidato.
; Incrementa a quantidade de votos do candidato correspondente se o número for válido (1, 2, 3 ou 4).

(define (incrementa-voto resultado num-candidato)
  (cond
    [(eq? (valida-numero num-candidato) 'Inválido) resultado]
    [(= num-candidato 1) (make-resultado-votacao (+ 1 (resultado-votacao-candidato1 resultado))
                                            (resultado-votacao-candidato2 resultado)
                                            (resultado-votacao-candidato3 resultado)
                                            (resultado-votacao-candidato4 resultado))]
    [(= num-candidato 2) (make-resultado-votacao (resultado-votacao-candidato1 resultado)
                                            (+ 1 (resultado-votacao-candidato2 resultado))
                                            (resultado-votacao-candidato3 resultado)
                                            (resultado-votacao-candidato4 resultado))]
    [(= num-candidato 3) (make-resultado-votacao (resultado-votacao-candidato1 resultado)
                                            (resultado-votacao-candidato2 resultado)
                                            (+ 1 (resultado-votacao-candidato3 resultado))
                                            (resultado-votacao-candidato4 resultado))]
    [(= num-candidato 4) (make-resultado-votacao (resultado-votacao-candidato1 resultado)
                                            (resultado-votacao-candidato2 resultado)
                                            (resultado-votacao-candidato3 resultado)
                                            (+ 1 (resultado-votacao-candidato4 resultado)))]
    [else resultado]))

; Exemplo de uso
(check-expect (incrementa-voto (make-resultado-votacao 10 20 15 5) 2) (make-resultado-votacao 10 21 15 5)) 
(check-expect (incrementa-voto (make-resultado-votacao 10 20 15 5) 1) (make-resultado-votacao 11 20 15 5)) 
(check-expect (incrementa-voto (make-resultado-votacao 10 20 15 5) 7) (make-resultado-votacao 10 20 15 5)) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (f) Escreva uma função que, dada uma lista de votos, devolve o resultado da votação. Este resultado é uma lista contendo 5 pares (um para cada candidato e um para os votos brancos/nulos). Cada par da lista contém um número, que pode ser um número de candidato ou o número zero, representando votos brancos/nulos, e o número de votos correspondentes (votos no candidato ou votos brancos/nulos).

;; Apesar do desenvolvimento nos itens anteriores, a questão pede que o resultado seja uma lista de pares e não a estrutura já definida... acredito ser um erro no enunciado, mas a nós cabe implementar o que foi requisitado na documentação.

; Função para processar a lista de votos e calcular o resultado da votação
; resultado-da-votacao : ListaVotos -> ListaPares
; Recebe uma lista de votos e calcula o resultado da votação, retornando um registro de resultado-votacao.

; Função auxiliar para contar votos nulos e brancos
; count-votes-invalid : ListaVotos -> Número
; Obj: Conta o número de votos inválidos na ListaVotos.
(define (count-votes-invalid votos)
  (cond
    [(empty? votos) 0]
    [(eq? (valida-numero (first votos)) 'Inválido) (+ 1 (count-votes-invalid (rest votos)))]
    [else (+ 0 (count-votes-invalid (rest votos)))]
   )
  )
(check-expect (count-votes-invalid votos-exemplo1) 3)
(check-expect (count-votes-invalid votos-exemplo2) 4)

(define (resultado-da-votacao votos)
  (cons
   (cons 1 (count-votes votos 1))
   (cons
    (cons 2 (count-votes votos 2))
    (cons
     (cons 3 (count-votes votos 3))
     (cons
      (cons 4 (count-votes votos 4))
      (cons
       (cons 0 (count-votes-invalid votos)) 
       empty)
      )
     )
    )
  )
  )

(check-expect (resultado-da-votacao votos-exemplo1) (cons (cons 1 3) (cons (cons 2 1) (cons (cons 3 0) (cons (cons 4 1) (cons (cons 0 3) empty))))))
(check-expect (resultado-da-votacao votos-exemplo2) (cons (cons 1 1) (cons (cons 2 1) (cons (cons 3 2) (cons (cons 4 0) (cons (cons 0 4) empty))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 3. (3 pontos) Analise o programa a seguir e responda as questões abaixo. Considere que a estrutura posn já foi definida com os campos x e y (veja exemplos abaixo), bem como o tipo de dados ListaPosn, que contém listas cujos elementos são posn.

;; (a) Complete o código em todos os locais pontilhados.

; Exemplos de elementos do conjunto Posn:

(define POSN1 (make-posn 2 3))
(define POSN2 (make-posn 2 4))
(define POSN3 (make-posn 4 3))

;; Exemplos de elementos do conjunto ListaPosn:

(define LISTA1 (cons POSN1 (cons POSN2 empty)))
(define LISTA2 (cons POSN1 (cons POSN3 (cons POSN1 empty))))
(define LISTA3 (cons POSN1 (cons POSN2 (cons POSN1 (cons POSN1 empty)))))

;; funcaoX : posn posn -> Booleano
;; Obj: Compara dois pontos 2D e retorna #true se eles forem iguais e #false caso contrário

;; Exemplos:
;; (funcaoX POSN1 POSN2) = #false
;; (funcaoX POSN1 POSN1) = #true
;; (funcaoX POSN3 POSN1) = #false

(define (funcaoX a b)
  (and (= (posn-x a) (posn-x b)) (= (posn-y a) (posn-y b)))
)

;; funcaoY : Posn ListadePosn -> ListadePosn
;; Obj: Dado um ponto 2D a e uma lista de pontos 2D, remove os pontos iguais ao ponto a.

;; Exemplos:
;; (funcaoY POSN1 empty) = empty
;; (funcaoY POSN3 LISTA2) = (cons POSN1 (cons POSN2 (cons POSN1 (cons POSN1 empty))))
;; (funcaoY POSN1 LISTA3) = (cons POSN2 empty)

(define (funcaoY a b)
  (cond
   [(empty? b) empty]
   [(funcaoX a (first b)) (funcaoY a (rest b))]
   [else (cons (first b) (funcaoY a (rest b)))]
   )
  )

;; funcaoZ : ListadePosn -> ListadePosn
;; Obj: Dada uma lista de pontos 2D x e uma lista de pontos 2D y, devolve uma lista de pontos 2D composta pelos elementos de x que não estão em y.

;; Exemplos:
;; (funcaoZ LISTA1 empty) = (cons POSN1 (cons POSN2 empty))
;; (funcaoZ empty LISTA1) = empty
;; (funcaoZ LISTA3 (cons POSN1 empty)) = (cons (make-posn 2 4) empty)
;; (funcaoZ LISTA3 LISTA2) = (cons (make-posn 2 4) empty)

(define (funcaoZ x y)
  (cond
   [(empty? y) x]
   [else (funcaoZ (funcaoY (first y) x) (rest y))]
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (b) Liste todas as chamadas da função funcaoZ geradas pela execução de (funcaoZ LISTA3 LISTA2), na ordem na qual as chamadas acontecem. Deixe claro quais os argumentos de cada chamada, bem como o resultado de cada uma.

; 1: (funcaoZ (cons POSN1 (cons POSN2 (cons POSN1 (cons POSN1 empty)))) (cons POSN1 (cons POSN3 (cons POSN1 empty))))
; 2: (funcaoZ (cons POSN2 empty) (cons POSN3 (cons POSN1 empty)))
; 3: (funcaoZ (cons POSN2 empty) (cons POSN1 empty))
; 4: (funcaoZ (cons POSN2 empty) empty)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;