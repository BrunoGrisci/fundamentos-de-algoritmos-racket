;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname testa_soma) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Prof. Bruno Iochins Grisci

;; (a) (1 ponto) Complete o programa.

(define (testa-soma x y z)
  
;; testa-soma: Numero Numero Numero --> Numero ou Símbolo
;; A função testa-soma calcula o SOMA usando a função soma e depois verifica se SOMA é um símbolo (indicando um erro), maior que z, menor que z, ou igual a z.
;; exemplos:
;; (testa-soma 1 3 100) = 'Menor
;; (testa-soma 5 1 100) = 'ArgumentosInvalidos
;; (testa-soma 2 4 7) = 'Maior
;; (testa-soma 2 4 20) = 20
  
(local (
;; soma: Numero Numero --> Numero ou Símbolo
;; A função soma recebe dois argumentos, i e nivel. Ela calcula recursivamente uma soma baseada no nível de recursão (nivel). Se os argumentos x ou y forem inválidos (por exemplo, se x for maior que y ou se algum deles for menor que 1), ela retorna 'ArgumentosInvalidos.
;; exemplos:
;; x=1 e y=4 e (soma 1 1) = 30 // 1+2+3+4 + 2+3+4 + 3+4 + 4
;; x=2 e y=4 e (soma 2 1) = 20 //           2+3+4 + 3+4 + 4
;; x=3 e y=4 e (soma 3 1) = 11 //                   3+4 + 4
;; x=1 e y=1 e (soma 1 1) = 1
;; 
(define (soma i nivel)
  (cond
   [(or (> x y) (< x 1) (< y 1)) 'ArgumentosInvalidos]
   [(= i y) i]
   [(= nivel 1) (+ (soma i 2) (soma (+ i 1) 1))]
   [else (+ i (soma (+ i 1) 2))]
   )
  )
        (define SOMA (soma x 1))
        )
       (cond
        [(symbol? SOMA) SOMA]
        [(> SOMA z) 'Maior]
        [(< SOMA z) 'Menor]
        [(= SOMA z) SOMA]
        )
       )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (b) (1 ponto) Indique as modificações que seriam necessárias para eliminar o uso do local desta função, mantendo o resultado da função inalterado.

(define (soma-sem-local x y i nivel)
  (cond
   [(or (> x y) (< x 1) (< y 1)) 'ArgumentosInvalidos]
   [(= i y) i]
   [(= nivel 1) (+ (soma-sem-local x y i 2) (soma-sem-local x y (+ i 1) 1))]
   [else (+ i (soma-sem-local x y (+ i 1) 2))]
   )
)

(define (testa-soma-sem-local x y z)
    (cond
     [(symbol? (soma-sem-local x y x 1)) (soma-sem-local x y x 1)]
     [(> (soma-sem-local x y x 1) z) 'Maior]
     [(< (soma-sem-local x y x 1) z) 'Menor]
     [(= (soma-sem-local x y x 1) z) (soma-sem-local x y x 1)]
    )
)

;; Ambas as funções tem o mesmo comportamento:
(check-expect (testa-soma-sem-local 1 3 100) (testa-soma 1 3 100)) 
(check-expect (testa-soma-sem-local 5 1 100) (testa-soma 5 1 100))
(check-expect (testa-soma-sem-local 2 4 7) (testa-soma 2 4 7))
(check-expect (testa-soma-sem-local 2 4 20) (testa-soma 2 4 20))

;; Modificações realizadas:
;; Função soma: A função soma foi movida para fora da função testa-soma e agora recebe os parâmetros x e y além de i e nivel, pois esses valores são necessários para a recursão.
;; Remoção do local: Como a função soma foi movida para fora, o uso de local não é mais necessário.
;; Cálculo de SOMA: Dentro da função testa-soma, SOMA foi substituido pelas chamadas de soma-sem-local.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (c) (1 ponto) Discuta as vantagens/desvantagens do uso de local nesta função, incluindo uma comparação entre os tempos de execução das duas versões da função (com e sem local).

;; Clareza e Organização:
;;    O uso de local permite que você encapsule definições auxiliares, como a função soma e a variável SOMA, diretamente dentro do corpo de testa-soma. Isso pode tornar o código mais legível, pois todas as definições relacionadas à função estão agrupadas em um único local.

;; Escopo Restrito:
;;    As variáveis e funções definidas dentro de local têm um escopo limitado, o que significa que não podem interferir com outras partes do código. Isso reduz a chance de erros causados por variáveis com o mesmo nome em outros lugares do programa.

;; Reusabilidade Controlada:
;;    As funções e variáveis definidas dentro de local são específicas para a função que as contém, evitando que sejam acidentalmente reutilizadas fora de contexto em outras partes do código.

;; O uso de local permite definir e armazenar o resultado de cálculos intermediários, como SOMA, que pode ser usado repetidamente dentro da função sem recalculá-lo. Se usado corretamente, isso pode melhorar o desempenho.
;; A versão com local evita chamadas repetitivas de funções computacionalmente caras, pois a variável é calculada uma vez e reutilizada.

;; Na versão sem local o mesmo cálculo pode ser repetido várias vezes, o que pode ser menos eficiente.
;; O código sem local, mas sem otimizações, pode resultar em tempos de execução maiores devido à repetição de cálculos.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (d) (1 ponto) Justifique a terminação da função soma.

;; A terminação da função soma é garantida porque, a cada chamada recursiva, o valor de i aumenta, aproximando-se de y. Como uma das condições de parada é i = y, a função eventualmente atinge esse caso base e retorna o valor de i, interrompendo a recursão. Além disso, a recursão só ocorre quando nivel é maior que zero, assegurando que a função não entre em um ciclo infinito.

