#language: pt

Funcionalidade: Uso de Cupons no checkout

    Como usuário da Starbugs, eu quero aplicar cupons de descontos na página de checkout.
    Para que eu possa obter redução no preço do produtos específicos, aumentando a satisfação com a minha experiência de compra.

    Contexto: 
        Dado que iniciei a compra do item:
            | name      | Café com Leite |
            | price     | R$ 19,99       |
            | delivery  | R$ 10,00       |
            | total     | R$ 29,99       |


    Cenário: Aplicar Desconto

        Quando aplico o seguinte cupom: "MEUCAFE"
        Então o valor final da compra deve ser atualizado para "R$ 25,99"


    # ESPECIFICAÇÃO PARA O DEV DESENVOLVER ORIENTADO AO COMPORTAMENTO
        # Dado que estou na página de checkout
        #     E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
        #     E que a taxa de entrega é de R$ 10,00
        #     E tenho um cupom com 20% de desconto "MEUCAFE"
        # Quando aplico esse cupom de desconto
        # Então o desconto de 20% deve ser aplicado apenas no valor do Café com Leite
        #     E o valor final da compra deve ser atualizado para R$ 25,99

    
# FOI IMPLEMENTADO O CENÁRIO OUTLINE
    # Cenário: Cupom Expirado

    #     Quando aplico o seguinte cupom: "PROMO20"
    #     Então devo ver a noticifação: "Cupom expirado!"
    #         E o valor final da compra deve permanecer o mesmo 



    # ESPECIFICAÇÃO PARA O DEV DESENVOLVER ORIENTADO AO COMPORTAMENTO
        # Dado que estou na página de checkout
        #     E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
        #     E que a taxa de entrega é de R$ 10,00
        #     E tenho um cupom que está expirado "PROMO20"
        # Quando aplico esse cupom de desconto
        # Então devo ver a seguinte noticifação "Cupom expirado!"
        #     E o valor final deve permanecer o mesmo


# FOI IMPLEMENTADO O CENÁRIO OUTLINE
    # Cenário: Cupom Inválido

    #     Quando aplico o seguinte cupom: "PROMO100"
    #     Então devo ver a noticifação: "Cupom inválido!"
    #         E o valor final da compra deve permanecer o mesmo 


    # ESPECIFICAÇÃO PARA O DEV DESENVOLVER ORIENTADO AO COMPORTAMENTO
        # Dado que estou na página de checkout
        #     E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
        #     E que a taxa de entrega é de R$ 10,00
        #     E tenho um cupom com o código inválido "TESTCUPOM"
        # Quando aplico esse cupom de desconto
        # Então devo ver a seguinte noticifação "Cupom Inaálido!"
        #     E o valor final deve permanecer o mesmo


# CENÁRIO OUTLINE
    Esquema do Cenário: Tentativa de aplicar o desconto

    Quando aplico o seguinte cupom: "<cupom>"
        Então devo ver a noticifação: "<saida>"
            E o valor final da compra deve permanecer o mesmo 

    
    Exemplos: 
        | cupom     | saida           |
        | PROMO20   | Cupom expirado! |
        | PROMO100  | Cupom inválido! |