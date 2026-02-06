;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname projeto03_enunciado_pokemon) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; PROJETO 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;##########################################################################
;; IDENTIFICAÇÃO DO GRUPO
;; Escreva abaixo, em ordem alfabética, o nome e número de matrícula de todos os membros do grupo:
;;     Nome     Sobrenome    Matrícula
;; 1.
;; 2.
;; 3.
;##########################################################################
;
;##########################################################################
;### PROJETO 3
;##########################################################################
;
;INSTRUÇÕES:
;
;Leia com atenção os enunciados, você deverá implementar EXATAMENTE o que está sendo pedido. Em caso de dúvidas contate o professor.
;
;O projeto deve ser desenvolvido em grupos de 3 alunos.
;
;O projeto deve ser entregue via Moodle atá o prazo limite estabelecido. Apenas um dos integrantes do grupo deve submeter o trabalho, colocando o nome completo e número de matrícula de todos os membros do grupo.
;
;Você deve usar EXATAMENTE os nomes dos tipos de dados e atributos e a ordem dos atributos definidos abaixo.
;
;Você deve usar EXATAMENTE os nomes das funções e a ordem dos argumentos de entrada definidos acima, mas pode escolher os nomes que quiser para os argumentos. A escolha adequada dos nomes fará parte da avaliação.
;
;Não esqueça da documentação completa (contrato, objetivo, exemplos) de TODAS as estruturas e funções que você definir! A documentação correta e completa faz parte da avaliação, valendo nota.
;
;Você pode implementar funções auxiliares extras para resolver os exercícios, mesmo que o enunciado não diga explicitamente para criá-las. Contudo, definir e implementar corretamente as funções solicitadas nos enunciados, com exatamente o mesmo nome e argumentos de entrada, é obrigatório.
;
;Para cada função que você implementar (inclusive auxiliares), exceto as que retornam imagens, adicione pelo menos três casos de teste usando check-expect.
;
;Você pode reaproveitar partes do código de seus projetos anteriores da disciplina se assim quiser.
;
;Você pode e deve consultar a documentação de Scheme/Racket disponível no Moodle da turma, no livro da disciplina (https://htdp.org/2023-8-14/Book/index.html) e no site oficial (https://docs.racket-lang.org/).
;
;Você pode desenvolver seu código na plataforma que preferir, mas ele será obrigatoriamente avaliado usando WeScheme (https://www.wescheme.org), então garanta que ele funciona corretamente neste ambiente.
;
;; ===========================================================================
;;                              DEFINIÇÕES DE DADOS
;; Não altere as definições desta seção! Leia com atenção e use-as. 
;; ===========================================================================
;; -----------------
;; TIPO Tipo:
;; -----------------
;; Um Tipo pode ser
;; 1. "Normal", ou
;; 2. "Fire", ou
;; 3. "Fighting", ou
;; 4. "Water", ou
;; 5. "Flying", ou
;; 6. "Grass", ou
;; 7. "Poison", ou
;; 8. "Electric", ou
;; 9. "Ground", ou
;; 10. "Psychic", ou
;; 11. "Rock", ou
;; 12. "Ice", ou
;; 13. "Bug", ou
;; 14. "Dragon", ou
;; 15. "Ghost", ou
;; 16. "Dark", ou
;; 17. "Steel", ou
;; 18. "Fairy"

;; -----------
;; TIPO Pokemon:
;; -----------

(define-struct pokemon 
               (especie  
                tipo1 
                tipo2))
;; Um elemento do conjunto Pokemon tem o formato
;;    (make-pokemon e t1 t2), onde
;;    e : String, é a espécie do Pokemon
;;    t1 : Tipo, é o tipo 1 do Pokemon
;;    t2 : Tipo, é o tipo 2 do Pokemon

;; -----------
;; TIPO PokemonCapturado:
;; -----------

(define-struct pokemoncapturado 
               (pokemon 
                apelido 
                nivel 
                hpmaximo 
                hpatual))
;; Um elemento do conjunto PokemonCapturado tem o formato
;;    (make-pokemoncapturado p a n hm ha), onde
;;    p : Pokemon, é o Pokemon
;;    a : String, é o apelido do PokemonCapturado
;;    n : Number, é o nivel do PokemonCapturado
;;    hm: Number, é o hp máximo do PokemonCapturado
;;    ha: Number, é o hp atual do PokemonCapturado

;; -------------------
;; TIPO Time:
;; -------------------
;; Um Time é
;;   1. vazio (empty), ou
;;   2. (cons pc t), onde
;;       pc : PokemonCapturado
;;       t  : Time
  
;; -------------------
;; TIPO Treinador:
;; -------------------
(define-struct treinador 
               (nome 
                idade 
                time))
;; Um elemento do conjunto Treinador tem o formato
;;    (make-treinador n i t), onde
;;    n : String, é o nome do Treinador
;;    i : Number, é a idade do Treinador
;;    t : Time, é o time do Treinador

;##########################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1    #####
;##########################################################################
;==========================================================================
;Usando as estruturas definidas acima:
;Defina 4 constantes cujos valores sejam do tipo Pokemon.   
;Defina 4 constantes cujos valores sejam do tipo PokemonCapturado.   
;Defina 4 constantes cujos valores sejam do tipo Treinador.   
;DICA: você pode reaproveitar partes do seu código do PROJETO 2.
;==========================================================================

;##########################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2    #####
;##########################################################################
;==========================================================================
;Desenvolva um função chamada tamanho-time que, dado um Treinador, retorna o número de PokémonCapturados no time deste Treinador.
;==========================================================================
;
; --------------------------
; FUNÇÃO  tamanho-time:
; --------------------------

;##########################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3    #####
;##########################################################################
;==========================================================================
;Construa uma função tem-vaga? que, dado um Treinador, verifica se ele ou ela tem vaga no time para capturar um novo Pokémon, devolvendo #true se houver vaga e #false se não houver. Considere que o tamanho máximo de um time é 6 (seis) PokemonCapturados.
;==========================================================================

; ---------------------------------
; FUNÇÃO  tem-vaga?:
; ---------------------------------

;##########################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4    #####
;##########################################################################
;==========================================================================
;Um treinador que começa sua jornada sem nenhum Pokémon no time pode receber um PokémonCapturado de presente. Construa uma função recebe-inicial que, dado um elemento do tipo Treinador e um elemento do tipo PokemonCapturado, adiciona o PokemonCapturado no time do Treinador, desde que não haja outros PokemonCapturados no time. Se existir pelo menos um PokemonCapturado no time, a função recebe-inicial deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  recebe-inicial:
; ---------------------------------

;##########################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5    #####
;##########################################################################
;==========================================================================
;Um Treinador que já tem PokémonCapturado no time pode capturar novos Pokémon se tiver vagas livres no time. Construa uma função insere-pokemon que, dado um elemento do tipo Treinador e um elemento do tipo PokemonCapturado, insere o PokemonCapturado na primeira vaga disponível do time do Treinador, desde que exista pelo um PokemonCapturado no time e ainda existam vagas no time (o tamanho máximo do time é 6). Se não existir vaga no time ou se o time estiver vazio, a função insere-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  insere-pokemon:
; ---------------------------------

;##########################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6    #####
;##########################################################################
;==========================================================================
;Construa uma função libera-pokemon que, dado um elemento do tipo Treinador e uma String, remove do time do treinador o PokemonCapturado com apelido igual ao da String de entrada. Se não existir PokemonCapturado com apelido igual ao da String de entrada no time, a função libera-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  libera-pokemon:
; ---------------------------------

;##########################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7    #####
;##########################################################################
;==========================================================================
;Quando se visita um Centro Pokémon, é possível curar os danos sofridos pelos PokemonCapturados no time de um Treinador. Defina abaixo duas funções, a função cura-pokemoncapturado, que recebe um elemento do tipo PokemonCapturado e restora seu HP atual para ser igual ao seu HP máximo, e a função cura-time, que recebe de entrada um elemento do tipo Treinador e restora o HP atual de todos os PokemonCapturado no time para serem iguais aos seus HPs máximos.
;DICA: você pode reaproveitar partes do seu código do PROJETO 2.
;==========================================================================

; ---------------------------------
; FUNÇÃO  cura-pokemon:
; ---------------------------------

; ---------------------------------
; FUNÇÃO  cura-time:
; ---------------------------------

;##########################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8    #####
;##########################################################################
;==========================================================================
;Desenvolva a função existe-tipo-no-time? que, dado um Treinador e um tipo  de pokemon, nesta ordem, verifica se há algum pokemon daquele tipo no time do treinador, devolvendo #true ou #false de acordo.
;==========================================================================

; ---------------------------------
; FUNÇÃO  existe-tipo-no-time?:
; ---------------------------------

;##########################################################################
;### 9 ### 9 ### 9 ### 9 ### 9 ### 9 ### 9 ### 9 ### 9 ### 8 ### 9    #####
;##########################################################################
;==========================================================================
;Desenvolva a função remove-tipo que, dado um Treinador e um Tipo, remove de seu time todos os PokemonCapturados que sejam desse tipo (seja no tipo1 ou no tipo2).
;==========================================================================

; ---------------------------------
; FUNÇÃO  remove-tipo:
; ---------------------------------

;##########################################################################
;### 10 ### 10 ### 10 ### 10 ### 10 ### 10 ### 10 ### 10 ### 10       #####
;##########################################################################
;==========================================================================
;Desenvolva a função batalha que, dados dois Treinadores, faz uma batalha entre os times destes dois treinadores da seguinte maneira:
;Selecione os dois primeiros PokemonCapturado do time dos Treinadores que tenham hpatual maior que zero. Destes, o PokemonCapturado com hptatual maior vence a batalha e do seu hpatual é diminuido o valor de hptatual do PokemonCapturado perdedor. O hpatual do PokemonCapturado perdedor vira zero. Este processo se repete até um dos times ter todos os PokemonCapturados com hptatual igual a zero, neste caso o Treinador deste time perde a batalha.
;Em caso de empate, o Treinador mais velho vence a batalha. Se ambos tiverem a mesma idade, o segundo Treinador passado como entrada vence.
;A função batalha retorna o Treinador vencedor.
;==========================================================================

; ---------------------------------
; FUNÇÃO  batalha:
; ---------------------------------

;; Veja abaixo um exemplo de uma batalha:
;;    Treinador Ash
;;        1: Pikachu (hpatual = 50)
;;        2: Charizard (hpatual = 80)
;;        3: Bulbasaur (hpatual = 30)
;;
;;    Treinador Gary
;;        1: Eevee (hpatual = 60)
;;        2: Blastoise (hpatual = 70)
;;        3: Pidgeotto (hpatual = 40)
;;        4: Snorlax (hpatual = 90)
;;
;;Processo da Batalha
;;
;;    Primeiro Round:
;;        Selecionamos o primeiro Pokémon vivo de cada treinador:
;;            Ash: Pikachu (hpatual = 50)
;;            Gary: Eevee (hpatual = 60)
;;        Eevee tem mais pontos de vida e vence a batalha.
;;        Atualizamos o hpatual de Eevee:
;;            Eevee: hpatual = 60 - 50 = 10
;;        Pikachu fica com hpatual = 0 e é eliminado.
;;
;;    Segundo Round:
;;        Selecionamos os próximos Pokémon vivos:
;;            Ash: Charizard (hpatual = 80)
;;            Gary: Eevee (hpatual = 10)
;;        Charizard tem mais pontos de vida e vence a batalha.
;;        Atualizamos o hpatual de Charizard:
;;            Charizard: hpatual = 80 - 10 = 70
;;        Eevee fica com hpatual = 0 e é eliminado.
;;
;;    Terceiro Round:
;;        Selecionamos os próximos Pokémon vivos:
;;            Ash: Charizard (hpatual = 70)
;;            Gary: Blastoise (hpatual = 70)
;;        Charizard e Blastoise têm o mesmo hpatual.
;;       Atualizamos o hpatual de Blastoise:
;;            Blastoise: hpatual = 70 - 70 = 0
;;        Charizard e Blastoise ficam ambos com hpatual = 0 e são eliminados.
;;
;;    Quarto Round:
;;        Selecionamos os próximos Pokémon vivos:
;;            Ash: Bulbasaur (hpatual = 30)
;;            Gary: Pidgeotto (hpatual = 40)
;;        Pidgeotto tem mais pontos de vida e vence a batalha.
;;        Atualizamos o hpatual de Pidgeotto:
;;            Pidgeotto: hpatual = 40 - 30 = 10
;;        Bulbasaur fica com hpatual = 0 e é eliminado.
;;
;;    Quinto Round:
;;        Todos os Pokémon de Ash foram eliminados, então Gary ainda tem dois PokémonCapturados vivos, Pidgeotto (hpatual=10) e Snorlax (hpatual = 90).
;;
;;Resultado da Batalha:
;;Como todos os Pokémon de Ash foram derrotados o Treinador Gary é o vencedor da batalha. A função batalha retorna a estrutura de Gary como vencedor.