;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname aula7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; Baseado nos slides de João Marcos Flach
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; area-circulo: Numero - > Numero
;; objetivo: calcular a area de um circulo , dado seu raio r
;; exemplos: ( area-circulo 1) - > 3.14
;; ( area-circulo 3.5) - > 38.465
( define ( area-circulo r )
   (* 3.14 (* r r ) ) )

;; calcula-mira: Numero Numero Numero Numero Numero Numero Numero Numero Numero Numero Numero Numero Numero Numero Numero- > Numero
;; objetivo: calcular o angulo do canhao de um navio ...
;; exemplo:
;; ( calcula-mira 93.90 8.71 36.45 87.26 94.96 10.21 30.26 93.36 34.98 33.44 2.13 74.29 24.13 42.28 8.88) - > 37.85
;;( define ( calcula-mira px1 px2 py1 py2 vx1 vx2 vy1 vy2 ax1 ax2 ay1 ay2 ac1 ac2 vp ) ... )

;; calcula-mira: Navio Navio Numero- > Numero
;; objetivo: calcular o angulo do canhao de um navio ...
;; exemplos: ( calcula-mira navio-A navio-B ) - > X
;;( define ( calcula-mira navio-origem navio-alvo vel-proj )... )

(define-struct carro
  (fabricante
   modelo
   cor
   consumo
   tanque
   vel-max
   ))

(define ford-fiesta (make-carro "Ford" "Fiesta" "Prata" 11 40 160))

ford-fiesta

(define p911 (make-carro "Porsche" "p911" "Vermelho" 7 64 220))

p911

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; autonomia: Carro -> Numero
;; Objetivo: calcular a autonomia, em km, de um carro
;; exemplos:
;; (autonomia
;; (make-carro "Ford" "Fiesta" "Prata" 11 40 160) ) -> 440
;; (autonomia
;; (make-carro "Porsche" "p911" "Vermelho" 7 64 220) -> 448
(define (autonomia um-carro )
  (* ( carro-consumo um-carro ) ( carro-tanque um-carro ) ) )

(autonomia ford-fiesta)

(autonomia p911)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; distancia-ate-0: Posn -> Numero
;; Objetivo: calcula a distancia de um ponto ate a origem
;; Exemplos:
;; ( distancia-ate-0 ( make-posn 1 0) 1)
;; ( distancia-ate-0 ( make-posn 0 3) 3)
(define (distancia-ate-0 par)
  (sqrt 
   (+ (sqr (posn-x par)) 
      (sqr (posn-y par)))))

(distancia-ate-0 (make-posn 0 1))

(define PORTO-ALEGRE (make-posn -30 51))

(distancia-ate-0 PORTO-ALEGRE)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; incrementa-vel-max: Carro Numero -> Carro
;; Objetivo: dado um carro e um número representando uma velocidade em km/h, somar esse número à velocidade máxima do carro
;; Exemplos:
;; ( incrementa-vel-max ( make-carro ' Ford ' Fiesta ' Prata 11 40 160) 20) - > ( make-carro ' Ford 'Fiesta ' Prata 11 40 180)
;; ( incrementa-vel-max ( make-carro ' Porsche ' p911 ' Vermelho 7 64 220) 50) - > ( make-carro ' Porsche ' p911 ' Vermelho 7 64 270)
( define ( incrementa-vel-max um-carro incremento-vel )
 ( make-carro
 ( carro-fabricante um-carro )
 ( carro-modelo um-carro )
 ( carro-cor um-carro )
 ( carro-consumo um-carro )
 ( carro-tanque um-carro )
 (+ ( carro-vel-max um-carro ) incremento-vel ) ) )

(incrementa-vel-max (make-carro "Ford" "Fiesta" "Prata" 11 40 160) 20) 

(incrementa-vel-max p911 20) 

p911

(define p911-tunado (incrementa-vel-max p911 20)) 

p911-tunado

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; O que acontece se tentarmos criar a instância abaixo?
;; (make-carro 1 2 3 "x" "y" #false)
;; 
;; A linguagem deixa colocarmos quaisquer valores como atributo
;; quando criamos uma estrutura. De fato, não especificamos em lugar
;; nenhum qual o tipo de valor esperado para cada campo.
;;
;; Porém, o que acontece quando chamamos a função
;; incrementa-vel-max com a instância do slide anterior?
;; (incrementa-vel-max (make-carro 1 2 3 "x" "y" #false) 50)
;;
;; Apesar de não ser necessário especificar os tipos de dados de cada
;; campo de uma estrutura, quando criamos funções, geralmente
;; assumimos que a estrutura foi criada com alguns tipos em mente.
;; A definição de dados é uma convenção serve para que o
;; programador "diga" para o usuário como ele espera que a estrutura
;; seja criada.
;; 
;;
;; Por exemplo, a definição de dados para a estrutura "carro" ficaria 
;; assim:
;;
;; (define-struct carro (fabricante modelo cor consumo tanque vel-max ))
;;
;; Um elemento carro do conjunto Carro é uma estrutura
;; (make-carro uma-fabricante um-modelo uma-cor um-consumo um-tanque uma-vel-max), onde:
;; ;;uma-fabricante: String, é a fabricante do carro
;; ;;um-modelo: String, é o modelo do carro
;; ;;uma-cor: String, é a cor do carro
;; ;;um-consumo: Numero, é o consumo , em km/l, do carro
;; ;;um-tanque: Numero, é a capacidade do tanque, em litros,do carro
;; ;;uma-vel-max: Numero, é a velocidade máxima do carro em km/h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; "Desenvolva uma função que, dado um carro e um número,
;; aumenta a capacidade do seu tanque por esse número, se a sua
;; autonomia for menor que 350 km"
;;
;; aumenta-capacidade: Carro Numero -> Carro
;; Objetivo: dado um carro e um número representando uma capacidade em litros, somar esse número à capacidade do tanque do carro caso a autonomia do carro seja menor que 350km.
;; Exemplos:
;; ...
(define (aumenta-capacidade um-carro inc-capacidade)
  (cond
   [(< (autonomia um-carro) 350) 
    (make-carro
     (carro-fabricante um-carro)
     (carro-modelo um-carro)
     (carro-cor um-carro)
     (carro-consumo um-carro)
     (+ (carro-tanque um-carro) inc-capacidade)
     (carro-vel-max um-carro)  
     )]
   [else um-carro]
   )
  )

(aumenta-capacidade (make-carro "Chevrolet" "Opala" "Azul" 6 54 170) 50)

p911

(aumenta-capacidade p911 50)
  
