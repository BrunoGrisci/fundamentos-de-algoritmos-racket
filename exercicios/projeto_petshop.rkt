;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lista01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Lista1_solucao_alunos-Leila) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))



;; =======================
;; Definição de constantes:
;; =======================
(define LIVRE "livre")

(define FILLER_V (rectangle 1 10 "solid" "transparent"))
(define FILLER_H (rectangle 10 1 "solid" "transparent"))

;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################
;=====================================================================================================
;Defina um tipo de dados chamado Pet, que deve registrar o nome de um animal de estimação (pet), a sua
;cor, a sua idade, o nome do seu dono e o tipo de animal ele é (ex.: "Gato", "Cachorro","Cavalo", etc).
;O nome do pet, a cor o nome do dono e o tipo do animal devem ser do tipo String, e a idade deve ser do
;tipo Número. Defina 4 constantes cujos valores sejam do tipo Pet.   
;Defina também um tipo de dados chamado Vet, que deve registrar o nome de um veterinário, o seu turno
;de plantão (que pode ser "Manhã", "Tarde" ou "Noite"), a sua especialidade (o tipo de animal que ele
;atende) e os três espaços de atendimentos deste veterinário. O nome, o turno e a especialidade devem
;ser do tipo String. Cada espaço de atendimento pode ser um animal (tipo Pet) ou pode estar livre
;(neste caso, deve ser utilizada a string "livre"). Defina 4 constantes cujos valores sejam do tipo Vet.    
;Você deve usar EXATAMENTE os nomes dos tipos de dados e a ordem dos argumentos definidos acima, mas
;pode escolher os nomes que quiser para os atributos).
;=====================================================================================================

;; -----------------
;; TIPO Pet:
;; -----------------
(define-struct Pet (nome cor idade dono tipo))
;Um elemento do conjunto Pet tem o formato
;    (make-Pet n c i d t)
;onde:
;     n: String, representa o nome do pet
;     c: String, representa a cor do pet 
;     i: Número, representa a idade do pet
;     d: String, representa o nome do dono do pet
;     t: String, representa de qual tipo de animal o pet é (ex.: "Cachorro", "Gato", etc)



;; Constantes do tipo Pet:

(define PET1 (make-Pet "Marie" "Preto" 4 "Gabrieli" "Gato"))
(define PET2 (make-Pet "Salem" "Preto" 1 "Alleff" "Gato"))
(define PET3 (make-Pet "Persefone" "Branco" 10 "Dymytry" "Pássaro"))
(define PET4 (make-Pet "Lilith" "Cinza" 3 "José" "Cachorro"))

;--------------------------------
; TIPO PetOuString:
;--------------------------------
;O tipo PetOuString é
;1. Pet
;2. String


;; -----------------
;; TIPO Vet:
;; -----------------
(define-struct Vet (nome turno spec pet1 pet2 pet3))
;Um elemento do conjunto Vet tem o formato
;    (make-Pet n t s p1 p2 p3)
;onde:
;     n: String, representa o nome do veterinário
;     t: String, representa o turno de trabalho do veterinário (ex.: "Manhã", "Tarde", "Noite")
;     s: String, representa a especialidade do veterinário (ex.: "Cachorro", "Gato", "Cavalo", etc)
;     p1: PetOuString, representa o pet alocado ao veterinário no primeiro horário ou se está "livre".
;     p2: PetOuString, representa o pet alocado ao veterinário no segundo horário ou se está "livre"
;     p3: PetOuString, representa o pet alocado ao veterinário no terceiro horário ou se está "livre"


;; Constantes do tipo Vet:
(define VET1 (make-Vet "Maria" "Manhã" "Cavalo" (make-Pet "pé-de-pano1" "Branco" 10 "Willy" "Cavalo")
                       (make-Pet "pé-de-pano2" "Branco" 10 "Willy" "Cavalo")
                       (make-Pet "pé-de-pano3" "Branco" 10 "Willy" "Cavalo")))
(define VET2 (make-Vet "Luciana" "Tarde" "Gato" PET1 PET2 LIVRE))
(define VET3 (make-Vet "Ricardo" "Noite" "Cachorro" PET4 LIVRE LIVRE))
(define VET4 (make-Vet "Tiago" "Noite" "Cachorro" LIVRE LIVRE LIVRE))
(define VET5 (make-Vet "Jeremias" "Manhã" "Cachorro" PET1 LIVRE PET2))
(define VET6 (make-Vet "Luís" "Noite" "Cachorro" PET1 LIVRE PET2))


;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################




;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################
;=====================================================================================================
;Desenvolva um função chamada é-pet? que, dado um Pet ou uma String, verifica se a entrada é do tipo
;Pet ou do tipo String, retornando verdadeiro se for do tipo Pet e falso caso contrário.
;=====================================================================================================

;é-pet?: PetOuString -> Boolean
;Objetivo:Dado um PetOuString, se o parâmetro passado for do tipo Pet devolver verdadeiro. Caso contrário
;devolver falso.
;Exemplos:
;         (é-pet? PET1) = #t
;         (é-pet? PET2) = #t
;         (é-pet? 1) = #f
;         (é-pet? "livre") = #f

(define (é-pet? ps) 
  (cond
    ;; se ps for um Pet, devolve verdadeiro
    [(Pet? ps) #t]
    ;; senão, devolve falso
    [else #f]))

;; Testes:
(check-expect (é-pet? PET1) #t)
(check-expect (é-pet? PET2) #t)
(check-expect (é-pet? 1) #f)
(check-expect (é-pet? "PET1") #f)
(check-expect (é-pet? "Livre") #f)

;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################



;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################
;=====================================================================================================
;Construa uma função verifica-disponibilidade que, dado um veterinário, verifica se ele está disponível
;para atender um novo pet, ou seja, caso algum de seus espaços de atendimento seja "livre", devolve
;verdadeiro, caso contrário, gera um resultado falso.
;=====================================================================================================

;verifica-disponibilidade: Vet -> Boolean
;Objetivo:Dado um veterinário, verifica se pelo menos um dos espeços destinados para Pet está disponível,
;se sim devolver verdadeiro. Caso contrário, devolver falso.
;Exemplos:
;         (verifica-disponibilidade VET1) = #f
;         (verifica-disponibilidade VET2) = #t
;         (verifica-disponibilidade VET3) = #t
;         (verifica-disponibilidade VET6) = #t

(define (verifica-disponibilidade vet)
  (cond
    ;; se vet tem disponibilidade em algum dos seus horários (algum deles não é um pet), devolve verdadeiro
    [(or (not (é-pet? (Vet-pet1 vet))) (not (é-pet? (Vet-pet2 vet))) (not (é-pet? (Vet-pet3 vet)))) #t]
    ;; senão, devolve falso
    [else #f]))

;; Testes:
(check-expect (verifica-disponibilidade VET1) #f)
(check-expect (verifica-disponibilidade VET2) #t)
(check-expect (verifica-disponibilidade VET3) #t)
(check-expect (verifica-disponibilidade VET6) #t)

;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################


;#####################################################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 #####
;#####################################################################################################
;=====================================================================================================
;Quando um animal chega na petshop para ser atendido, deve ser verificado se o veterinário pode ou não
;atendê-lo. Desenvolva uma função chamada adiciona-pet que, dado um veterinário e um animal, nesta ordem,
;realiza o encaminhamento deste animal para este veterinário. O animal deve ser inserido na primeira
;posição de atendimento livre do veterinário, gerando assim um novo registro de veterinário. Caso não
;seja possível o encaixe (ou seja, caso todas as posições estejam ocupadas), devolver a frase
;"Sem horário disponível".
;=====================================================================================================

;--------------------------------
; TIPO VetOuString:
;--------------------------------
;O tipo VetOuString é
;1. Vet
;2. String

;adiciona-pet: Vet Pet -> VetOuString
;Objetivo:Dado um veterinário e um pet, verificar se um veterinário possui um espeço disponível para
;realizar o atendimento de um pet. Caso exista um espaço, construir um novo registro do veterinário
;com a adição do pet passado por parâmetro. Caso contrário, devolver a string "Sem horário disponível".
;Exemplos:
;         (adiciona-pet VET1 PET1) = "Sem horário disponível"
;         (adiciona-pet VET4 PET1) = (make-Vet "Tiago" "Noite" "Cachorro"
;                                        (make-Pet "Marie" "Preto" 4 "Gabrieli" "Gato")
;                                        "livre"
;                                        "livre")

(define (adiciona-pet vet pet)
  (cond
    ;; se vet tem algum horário disponível
    [(verifica-disponibilidade vet)
     (cond
       ;; se o primeiro horário está livre, devolve o registo de vet com o pet incluído no primeiro horário
       [(not (é-pet? (Vet-pet1 vet))) (make-Vet
                                       (Vet-nome vet)
                                       (Vet-turno vet)
                                       (Vet-spec vet)
                                       pet
                                       (Vet-pet2 vet)
                                       (Vet-pet3 vet))]
       ;; se o segundo horário está livre, devolve o registo de vet com o pet incluído no segundo horário
       [(not (é-pet? (Vet-pet2 vet))) (make-Vet
                                       (Vet-nome vet)
                                       (Vet-turno vet)
                                       (Vet-spec vet)
                                       (Vet-pet1 vet)
                                       pet                                   
                                       (Vet-pet3 vet))]
       ;; se o terceiro horário está livre, devolve o registo de vet com o pet incluído no terceiro horário
       [(not (é-pet? (Vet-pet3 vet))) (make-Vet
                                       (Vet-nome vet)
                                       (Vet-turno vet)
                                       (Vet-spec vet)                                       
                                       (Vet-pet1 vet)
                                       (Vet-pet2 vet)
                                       pet)])]
    ;; senão, devolve a mensagem indicando que não há horários livres
    [else "Sem horário disponível"]))

;; Testes:
(check-expect (adiciona-pet VET1 PET1) "Sem horário disponível")
(check-expect (adiciona-pet VET4 PET1) (make-Vet "Tiago" "Noite" "Cachorro" (make-Pet "Marie" "Preto" 4 "Gabrieli" "Gato") "livre" "livre"))

;#####################################################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 #####
;#####################################################################################################


;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################
;=====================================================================================================
;Defina um tipo de dados chamado PetShop, que deve registrar o nome da petshop, o endereço, o telefone
;de contato, e os dois veterinários que estão de plantão no momento (coloque os atributos da estrutura
;nesta ordem). O nome e o endereço devem ser do tipo String, o telefone do tipo Número. Os vetenirários
;de plantão devem ser do tipo Vet ou podem ser a string "vago" (representando que um dos plantonistas
;não está disponível). Defina 3 constantes cujos valores sejam do tipo PetShop.
;=====================================================================================================

(define-struct PetShop (nome endereço telefone vet1 vet2))
;Um elemento do conjunto PetShop tem o formato
;    (make-PetShop n e t v1 v2)
;onde:
;     n: String, representa o nome da PetShop
;     e: String, representa o endereço da PetShop
;     t: Número, representa o número de telefone da PetShop
;     v1: VetOuString, representa o veterinário que está de plantão ou se está "livre"
;     v2: VetOuString, representa o veterinário que está de plantão ou se está "livre"

;; Constantes do tipo PetShop:
(define PETSHOP1 (make-PetShop "Cobasi" "Ipiranga" 123456789 VET1 VET2))
(define PETSHOP2 (make-PetShop "PetLove" "Humaitá" 987654321 VET4 VET5))
(define PETSHOP3 (make-PetShop "Águia" "Bento Gonçalves" 543216789 VET3 LIVRE))
(define PETSHOP4 (make-PetShop "Papaléguas" "Centro" 432167895 VET1 VET5))
(define PETSHOP5 (make-PetShop "Coióte" "Centro" 321467895 LIVRE LIVRE))


;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################



;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################
;=====================================================================================================
;No momento da troca de turno, o registro da petshop deve ser atualizado, removendo os veterinários que
;não atuam no novo turno de trabalho. Construa uma função chamada termina-plantão que, dados uma PetShop
;e o novo turno (que pode ser "Manhã", "Tarde" ou "Noite"), nesta ordem, remove do registro os
;veterinários que não atuam neste novo turno. No caso de um veterinário ser removido, o registro deste
;veterinário na petshop deve atualizado para ao valor "vago". 
;=====================================================================================================


;termina-plantão: PetShop String -> PetShop
;Objetivo:Dado um PetShop e uma string (que representa o turno vigente), realiza a troca de turno dos
;veterinários, liberando os veterinários que não atuam neste turno.
;Exemplos:
   ;; (termina-plantão PETSHOP1 "Tarde") =  (make-PetShop "Cobasi" "Ipiranga" 123456789 "vago" VET2)
   ;; (termina-plantão PETSHOP1 "Noite") =  (make-PetShop "Cobasi" "Ipiranga" 123456789 "vago" "vago")
(define (termina-plantão PS TURNO)
  ;; constrói um novo registo da petshop com
   (make-PetShop
                (PetShop-nome PS)         ;; o nome da petshop PS
                (PetShop-endereço PS)     ;; o endereço da petshop PS
                (PetShop-telefone PS);; o telefone da petshop PS
                (verifica-final-plantao (PetShop-vet1 PS) TURNO)  ;; o veterinário 1 da petshop PS, caso ele continue, caso contrário estará vago
                (verifica-final-plantao (PetShop-vet2 PS) TURNO)));; o veterinário 2 da petshop PS, caso ele continue, caso contrário estará vago

;; Testes:
   (check-expect (termina-plantão PETSHOP1 "Tarde")   (make-PetShop "Cobasi" "Ipiranga" 123456789 "vago" VET2))
   (check-expect (termina-plantão PETSHOP1 "Noite")   (make-PetShop "Cobasi" "Ipiranga" 123456789 "vago" "vago"))

;; verifica-final-plantao: Vet String -> VetOuString
;; Dado um veterinário e um turno, devolve o veterinário, caso ele atue neste turno, ou "vago", caso contrário.
;; Exemplos:
   ;; (verifica-final-plantao VET1 "Tarde") =  "vago" 
   ;; (verifica-final-plantao VET1 "Manhã") =  VET1
(define (verifica-final-plantao VET TURNO)
  (cond
    [(string=? (Vet-turno VET) TURNO) VET]
    [else "vago"]))
;; Testes:
   (check-expect (verifica-final-plantao VET1 "Tarde")  "vago" )
   (check-expect (verifica-final-plantao VET1 "Manhã")  VET1)

;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################


;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################
;=====================================================================================================
;Quando um animal chega na petshop para atendimento, é necessário verificar se algum dos veterinários
;de plantão presta atendimento para este tipo de animal e tem horário livre para atendê-lo. Desenvolva
;uma função chamada aloca-pet-vet que, dados um animal (tipo Pet) e uma petshop (tipo PetShop), nesta
;ordem, verifica se algum dos veterinários que estão de plantão atende este tipo de animal e se possui
;vaga para o seu atendimento. Em caso positivo, deve-se incluir este animal no primeiro espaço de
;atendimento livre do veterinário e atualizar o registro da petshop. Caso contrário, deve-se retornar
;a mensagem "Sem horário disponível".
;=====================================================================================================

;--------------------------------
; TIPO PetShopOuString:
;--------------------------------
;O tipo PetShopOuString é
;1. PetShop
;2. String

;aloca-pet-vet: Pet PetShop -> PetShopOuString 
;Objetivo:Dado um Pet e uma PetShop, verifica se o tipo do pet pode ser atendido pelos veterinários que estão
;de plantão. Caso não haja nenhum veterinário no momento ou nenhum deles seja especialista no tipo do Pet, deve-se
;devolver a string "Sem horário disponível". Se houver algum veterinário que atenda o Pet, realizar o modificação
;do registro da PetShop, adicionando o pet ao veterinário.
;Exemplos:
;         (aloca-pet-vet PET1 PETSHOP4) = "Sem horário disponível"

(define (aloca-pet-vet pet petshop) 
  (cond
    ;; se nenhum dos veterinários disponíveis (se houver) trata este tipo de animal
    [(and
          (not (trata? (PetShop-vet1 petshop) (Pet-tipo pet)))
          (not (trata? (PetShop-vet2 petshop) (Pet-tipo pet))))
     ;; devolver a mensagem
     "Sem horário disponível"]
    ;; se o veterinário 1 da petshop atender o tipo de animal desejado e tiver disponibilidade,
    [(and (trata? (PetShop-vet1 petshop) (Pet-tipo pet))
          (verifica-disponibilidade (PetShop-vet1 petshop)))
           ;; monta um novo registro da petshop com
          (make-PetShop (PetShop-nome petshop)     ;; o nome da petshop
                        (PetShop-endereço petshop) ;; o endereço da petshop
                        (PetShop-telefone)         ;; o telefone da petshop
                        (adiciona-pet (PetShop-vet1 petshop) pet) ;; o novo registro do vet1, incluindo o novo pet
                        (PetShop-vet2 petshop))]   ;; o registro do vet2, inalterado
    ;; se o veterinário 2 da petshop atender o tipo de animal desejado e tiver disponibilidade, 
    [(and (trata? (PetShop-vet2 petshop) (Pet-tipo pet))
          (verifica-disponibilidade (PetShop-vet2 petshop)))
          ;; monta um novo registro da petshop com
          (make-PetShop (PetShop-nome petshop)     ;; o nome da petshop
                        (PetShop-endereço petshop) ;; o endereço da petshop
                        (PetShop-telefone)         ;; o telefone da petshop
                        (PetShop-vet1 petshop)     ;; o registro do vet1, inalterado
                        (adiciona-pet (PetShop-vet2 petshop) pet))])) ;; o novo registro do vet2, incluindo o novo pet


;; Testes:
(check-expect (aloca-pet-vet PET1 PETSHOP4) "Sem horário disponível")


;; trata? : Vet String -> Booleano
;; Dados um veterinário e um tipo de animal, verifica se o veterinário atende este tipo de animal.
(define (trata? VET TIPO)
       ;;  VET é um veterinário e ele trata este tipo de animal:
       (and (Vet? VET) (string=? TIPO (Vet-spec VET))))


;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################


;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################
;=====================================================================================================
;Desenvolva uma função chamada gera-lista-atendimentos que recebe uma PetShop e gera uma lista dos
;atendimentos que serão realizados nesta petshop pelos veterinários de plantão. A saída desta função
;deve ser uma imagem contendo o nome, endereço e telefone da petshop e, para cada veterinário de
;plantão, o nome do veterinário e os animais que serão atendidos. Para cada animal atendido, devem ser
;mostrados o nome, o tipo de animal e a idade.
;=====================================================================================================

;gera-lista-atendimentos: PetShop -> Imagem
;Objetivo:Dado uma Petshop, gera uma imagem referente ao prontuário de atendimento do veterinário.
;Exemplos:

;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################