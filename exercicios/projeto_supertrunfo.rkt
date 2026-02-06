;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lab01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 2htdp/image)

;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################

;Definição das constantes

;Desenhos
(define PACMAN (rotate 30 (circle 30 "solid" "gold")))
(define MESA (circle 200 "solid" "brown"))
(define PLAYER (above (circle 30 "solid" "salmon") (ellipse 30 60 "solid" "blue")))

;Fundo
(define FUNDO_PADRAO (rectangle 100 150 "solid" "slategray"))
(define FUNDO_VIDA (rectangle 100 150 "solid" "lightgreen"))
(define FUNDO_ATAQUE (rectangle 100 150 "solid" "lightred"))
(define FUNDO_DEFESA (rectangle 100 150 "solid" "lightblue"))
(define FUNDO_TRUNFO (rectangle 100 150 "solid" "orchid"))

;Borda
(define BORDA (rectangle 110 160 "outline" "white"))

;Strings
(define VIDA "vida")
(define ATAQUE "ataque")
(define DEFESA "defesa")
(define TRUNFO "trunfo")

(define VITORIA1 "JOGADOR 1 GANHOU")
(define VITORIA2 "JOGADOR 2 GANHOU")
(define EMPATE "EMPATE")

(define PLAYER1 "JOGADOR 1")
(define PLAYER2 "JOGADOR 2")

;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################




;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################

;; number->image: Number -> Image 
(define (number->image n) 
  (text 
   (number->string n) 20 "black")
  )

;; cria_box_info : Número Numero Numero Imagem -> Imagem
(define (cria_box_info hp atk def personagem)
  (above
   personagem
   (above
    (text (string-append "HP " (number->string hp)) 20 "darkred")
    (text (string-append "ATK " (number->string atk)) 20 "darkred")
    (text (string-append "DEF " (number->string def)) 20 "darkred"))
   )
  )

;cria_carta: Imagem Imagem Número Número Número -> Imagem
;Objetivo: Dado o desenho da carta, o fundo escolhido referente ao maior atributo e os valores de cada um dos três
;atributos da carta, devolve uma imagem com a carta montada.
;Exemplos:
;         (cria_carta PACMAN FUNDO_VIDA 40 20 20) = .

(define (cria_carta desenho fundo vida ataque defesa)
  (overlay 
   (cria_box_info vida ataque defesa desenho)
   fundo
   )
  )

;; (cria_carta PACMAN FUNDO_VIDA 40 20 20)

;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################




;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################

;maior_atributo_fundo: String -> Imagem
;Objetivo: Dado uma string, que pode ser qualquer um dos três atributos (VIDA, ATAQUE ou DEFESA) ou o tipo trunfo,
;devolve o fundo que deve ser colocado na carta referente ao atributo escolhido. Caso a carta não possua o melhor
;valor em nenhum dos atributos devolve o fundo padrão.
;Exemplo:
;         (maior_atributo_fundo VIDA) = .
;         (maior_atributo_fundo "x") = .

(define (maior_atributo_fundo texto)
  (cond
    [(string=? texto VIDA) FUNDO_VIDA]
    [(string=? texto ATAQUE) FUNDO_ATAQUE]
    [(string=? texto DEFESA) FUNDO_DEFESA]
    [(string=? texto TRUNFO) FUNDO_TRUNFO]
    [else FUNDO_PADRAO]
  )
  )

;; (maior_atributo_fundo "x")
;; (maior_atributo_fundo "vida")
;; (maior_atributo_fundo "trunfo")



;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################




;#####################################################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 #####
;#####################################################################################################

;; compara_atributos: Numero Numero -> String
(define (compara_atributos valor1 valor2) 
  (cond 
       [(> valor1 valor2) VITORIA1]
       [(< valor1 valor2) VITORIA2]
       [else EMPATE]))

;verifica_maior: String Número Número Número Número Número Número -> String
;Objetivo: Dado o atributo que será verificado nesta rododa e os valores da carta de cada um dos jogadores,
;devolve qual o jogador  que ganhou. Se ambos os valores do atributo escolhido forem iguais, devolver
;empate.
;Exemplo:
;         (verifica_maior VIDA 30 20 10 10 20 30) = "JOGADOR 1 GANHOU"
;         (verifica_maior ATAQUE 30 20 10 10 20 30) = "EMPATE"
;         (verifica_maior DEFESA 30 20 10 10 20 30) = "JOGADOR 2 GANHOU"
;         (verifica_maior VIDA 30 20 10 30 20 30) = "EMPATE"
(define (verifica_maior atr hp1 atk1 def1 hp2 atk2 def2)
  (cond
    [(string=? atr VIDA) (compara_atributos hp1 hp2)]
    [(string=? atr ATAQUE) (compara_atributos atk1 atk2)]
    [(string=? atr DEFESA) (compara_atributos def1 def2)]
    )
  )
(check-expect (verifica_maior VIDA 30 20 10 10 20 30) "JOGADOR 1 GANHOU")
(check-expect(verifica_maior ATAQUE 30 20 10 10 20 30) "EMPATE")
(check-expect(verifica_maior DEFESA 30 20 10 10 20 30) "JOGADOR 2 GANHOU")
(check-expect(verifica_maior VIDA 30 20 10 30 20 30) "EMPATE")

;#####################################################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 #####
;#####################################################################################################




;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################

;verifica_trunfo: Boolean Boolean -> Número
;Objetivo: Dados as condições se as cartas dos jogadores são trunfos ou não, verifica quem foi o vencedor
;correspondente. Caso ambos ou nenhum dos jogadores possuir o trunfo, o resultado é empate.
;Obs. Atribua valor '1' se o primeiro jogador venceu, valor '2' se o segundo jogador venceu e qualquer outro
;valor em caso de empate.
;Exemplos:
;         (verifica_trunfo #t #f) = 1
;         (verifica_trunfo #f #t) = 2
;         (verifica_trunfo #t #t) = 0
;         (verifica_trunfo #f #f) = 0
(define (verifica_trunfo t1 t2)
  (cond
    [(and t1 t2) 0] ;; t1 e t2 são trunfos
    [t1 1] ;; só t1 é trunfo
    [t2 2] ;; só t2 é trunfo
    [else 0] ;; nenhum é trunfo
    )
  )
(check-expect (verifica_trunfo #t #f) 1)
(check-expect (verifica_trunfo #f #t) 2)
(check-expect (verifica_trunfo #t #t) 0)
(check-expect (verifica_trunfo #f #f) 0)

;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################




;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################

;verifica_rodada: String Número Número Número Boolean Número Número Número Boolean -> String
;Objetivo: Dado o atributo da rodada, bem como os atributos das cartas de cada jogador, e se elas são do tipo
;trunfo ou não, devolve qual dos jogadores venceu esta rodada ou se houve empate.
;Exemplos:
;         (verifica_rodada VIDA 30 20 10 #f 20 10 30 #t) = "JOGADOR 2 GANHOU"
;         (verifica_rodada VIDA 30 20 10 #f 20 10 30 #f) = "JOGADOR 1 GANHOU"
;         (verifica_rodada ATAQUE 30 10 10 #f 20 10 30 #f) = "EMPATE"
(define (verifica_rodada atributo hp1 atk1 def1 trunfo1 hp2 atk2 def2 trunfo2)
  (cond
    [(= 1 (verifica_trunfo trunfo1 trunfo2)) VITORIA1]
    [(= 2 (verifica_trunfo trunfo1 trunfo2)) VITORIA2]
    [else (verifica_maior atributo hp1 atk1 def1 hp2 atk2 def2)]
    )
  )
(check-expect (verifica_rodada VIDA 30 20 10 #f 20 10 30 #t) "JOGADOR 2 GANHOU")
(check-expect (verifica_rodada VIDA 30 20 10 #f 20 10 30 #f) "JOGADOR 1 GANHOU")
(check-expect (verifica_rodada ATAQUE 30 10 10 #f 20 10 30 #f) "EMPATE")


;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################




;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################

;; desenha_nome: String Image -> Image
(define (desenha_nome nome jogador)
  (above
   (text nome 40 "black")
   jogador)
  )

;; cartas_na_mesa: Image Image Image -> Image
(define (cartas_na_mesa mesa carta1 carta2)
  (overlay
   (beside carta1 carta2)
   mesa
   )
  )

;desenha_mão: Imagem Imagem Imagem Imagem -> Imagem
;Objetivo: Dados as cartas dos jogadores e *[a imagem dos jogadores]*, devolve a imagem da situação
;do jogo atual;
;Exemplos:
;         (desenha_mão MAO_PLAY1 MAO_PLAY2 PLAYER PLAYER) = .
(define (desenha_mão mao1 mao2 play1 play2) 
  (beside
   (desenha_nome PLAYER1 PLAYER)
   (cartas_na_mesa MESA mao1 mao2)
   (desenha_nome PLAYER2 PLAYER)
   )
  )


;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################




;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################



;desenha_rodada: String Imagem Número Número Número Boolean Imagem Número Número Número Boolean
;Objetivo: Dados as cartas dos jogadores e *[a imagem dos jogadores]*, os valores de suas cartas e se os jogadores
;possuem ou não uma carta do tipo trunfo, desenha o resultado da rodada do jogo atual
;Exemplos:
;         (desenha_rodada ATAQUE PLAYER 40 20 20 #f PLAYER 40 60 20 #f) = .
(define (desenha_rodada atributo jogador1 hp1 atk1 def1 trunfo1 jogador2 hp2 atk2 def2 trunfo2)
  (above 
   (desenha_mão 
    (cria_carta PACMAN (maior_atributo_fundo atributo) hp1 atk1 def1) 
    (cria_carta PACMAN (maior_atributo_fundo atributo) hp2 atk2 def2)  
    jogador1 
    jogador2)
   (text (verifica_rodada atributo hp1 atk1 def1 trunfo1 hp2 atk2 def2 trunfo2) 20 "black")
   )
  )



;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################


(desenha_rodada ATAQUE PLAYER 40 20 20 #f PLAYER 40 60 20 #f)
