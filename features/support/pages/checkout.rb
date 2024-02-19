require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def check_product_details(product)
        product_title = find('.item-details h1')
        expect(product_title.text).to eql product[:name]
    
        sub_price = find('.subtotal .sub-price')
        expect(sub_price.text).to eql product[:price]
    
        delivery = find('.delivery-price')
        expect(delivery.text).to eql product[:delivery]
    end

    def check_total_price(total_price)
        price = find('.total-price')
        expect(price.text).to eql total_price
    end

    def find_zipcode(zipocde)
        find('input[name=cep]').set(zipocde)
        click_on 'Buscar CEP'
    end

    def fill_address(address)
        find('input[name=number]').set(address[:number])
        find('input[name=complement').set(address[:details])
    end

    def choice_payment_type(payment_type)
        find('label div', text: payment_type.upcase).click
    end

    def submit
        click_on 'Confirmar pedido'
    end

    def set_cupom(cupom_code)
        find('input[placeholder="Código do cupom"]').set(cupom_code)
            click_on 'Aplicar'
    end

    def assert_notice(text)
      notice = find('.notice').text
      expect(notice).to eql text
    end

end