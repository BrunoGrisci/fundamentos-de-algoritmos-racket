;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname projeto02_enunciado_pokemon) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; PROJETO 2
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
;### PROJETO 2
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
;##########################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1    #####
;##########################################################################
;==========================================================================
;Defina um tipo de dados chamado Pokemon, que deve registrar o nome de uma espécie de Pokémon ("Bulbasaur", "Charmander", "Squirtle", etc.), o seu tipo 1 ("Grass", "Fire", etc.), tipo 2.
;Se o Pokemon só tem um tipo, tipo 2 deve ter o Symbol 'vazio.
;
;Defina 4 constantes cujos valores sejam do tipo Pokemon.   

;Defina um tipo de dados chamado PokemonCapturado que deve registrar o Pokémon que foi capturado (estrutura Pokemon), o nome de um Pokémon capturado (uma string), o nível do Pokémon (um inteiro positivo), o HP máximo do Pokémon (um inteiro positivo), o HP atual do Pokémon (um inteiro positivo).
;
;Defina 4 constantes cujos valores sejam do tipo PokemonCapturado.   
;
;Defina também um tipo de dados chamado Treinador, que deve registrar o nome de um treinador (uma string), sua idade (um número) e seis vagas do time deste Treinador. Cada vaga de time pode ser um Pokémon capturado (tipo PokemonCapturado) ou pode estar livre (neste caso, deve ser utilizada o Symbol 'vazio). 
;
;Defina 4 constantes cujos valores sejam do tipo Treinador.    
;
;Escreva a documentação completa de cada estrutura como visto em aula.
;==========================================================================

;(define-struct pokemon (...))
;...
;Obs.: Use os seguintes nomes de atributos para esta estrutura: especie (String), tipo1 (String), tipo2 (String)

;(define-struct pokemoncapturado (...))
;...
;Obs.: Use os seguintes nomes de atributos para esta estrutura: pokemon (Pokemon), nome (String), nivel (Número), hpmaximo (Número), hpatual (Número)

;--------------------------------
; TIPO PokemonCapturadoOuSymbol:
;--------------------------------

;(define-struct treinador (...))
;...
;Obs.: Use os seguintes nomes de atributos para esta estrutura: nome (String), idade (Número), vaga1 (PokemonCapturadoOuSymbol), vaga1 (PokemonCapturadoOuSymbol), vaga2 (PokemonCapturadoOuSymbol), vaga3 (PokemonCapturadoOuSymbol), vaga4 (PokemonCapturadoOuSymbol), vaga5 (PokemonCapturadoOuSymbol), vaga6 (PokemonCapturadoOuSymbol)

;Defina as constantes abaixo:
;...

;##########################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2    #####
;##########################################################################
;==========================================================================
;Desenvolva um função chamada tamanho-time que, dado um Treinador, retorna o número de vagas do time que não são 'vazio (ou seja, são um PokémonCapturado).
;==========================================================================
;
; --------------------------
; FUNÇÃO  tamanho-time:
; --------------------------

;##########################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3    #####
;##########################################################################
;==========================================================================
;Construa uma função tem-vaga? que, dado um treinador, verifica se ele tem vaga no time para capturar um novo Pokémon, ou seja, caso algum de seus espaços de time seja 'vazio, devolve verdadeiro, caso contrário, gera um resultado falso.
;==========================================================================

; ---------------------------------
; FUNÇÃO  tem-vaga?:
; ---------------------------------

;##########################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4    #####
;##########################################################################
;==========================================================================
;Um treinador que começa sua jornada sem nenhum Pokémon no time pode receber um Pokémon de presente. Construa uma função recebe-pokemon que, dado um elemento do tipo Treinador e um elemento do tipo Pokemon, cria um elemento do tipo PokemonCapturado e o adiciona na primeira vaga com 'vazio do treinador, desde que todas as vagas atuais do time do treinador contenham 'vazio. Se existir vaga com um PokemonCapturado, a função recebe-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  recebe-pokemon:
; ---------------------------------

;##########################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5    #####
;##########################################################################
;==========================================================================
;Um treinador que já tem PokémonCapturado no time pode capturar novos Pokémon se tiver vagas livres no time. Construa uma função captura-pokemon que, dado um elemento do tipo Treinador e um elemento do tipo Pokemon, cria um elemento do tipo PokemonCapturado e o adiciona na primeira vaga com 'vazio do treinador, desde que exista pelo menos uma vaga com PokemonCapturado e exista uma vaga com 'vazio. Se não existir vaga com 'vazio, ou se todas as vagas tiverem 'vazio, a função captura-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  captura-pokemon:
; ---------------------------------

;##########################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6  m #####
;##########################################################################
;==========================================================================
;Construa uma função libera-pokemon que, dado um elemento do tipo Treinador e uma String, remove do time do treinador o PokemonCapturado com nome igual ao da string de entrada, colocando no lugar da vaga a string 'vazio. Se não existir vaga com PokemonCapturado com nome igual ao da string de entrada, a função libera-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  libera-pokemon:
; ---------------------------------

;##########################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7    #####
;##########################################################################
;==========================================================================
;Quando se visita um Centro Pokémon, é possível curar os danos sofridos pelos Pokémon Capturados no time de um Treinador. Defina abaixo duas funções, a função cura-pokemoncapturado, que recebe um elemento do tipo PokemonCapturado e restora seu HP atual para ser igual ao seu HP máximo, e a função cura-time, que recebe de entrada um elemento do tipo Treinador e restora o HP atual de todos os PokemonCapturado nas vagas de seu time para serem iguais aos seus HPs máximos.
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
;Desenvolva uma função desenha-time, que recebe de entrada um elemento do tipo Treinador e desenha na tela um resumo do seu time, aparecendo todos os PokémonCapturados do time do treinador. Você pode definir a maneira que achar melhor para representar os pokémon na tela, mas todos devem ser desenhados e as suas informações devem aparecer (nome, espécie, tipo1, tipo2, espécie, nível, etc.).
;DICA: você pode reaproveitar partes do seu código do PROJETO 1.
;==========================================================================

; ---------------------------------
; FUNÇÃO  desenha-time:
; ---------------------------------
