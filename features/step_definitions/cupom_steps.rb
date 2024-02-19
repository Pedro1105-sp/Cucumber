Dado('que iniciei a compra do item:') do |table|
    @product = table.rows_hash
    @home.open
    @home.buy(@product[:name])
end
  
Quando('aplico o seguinte cupom: {string}') do |cupom_code|
    @checkout.set_cupom(cupom_code)
end
  
Então('o valor final da compra deve ser atualizado para {string}') do |final_price|
    @checkout.check_total_price(final_price)
end

Então('devo ver a noticifação: {string}') do |notice|
    @checkout.assert_notice(notice)
end
  
Então('o valor final da compra deve permanecer o mesmo') do
    @checkout.check_total_price(@product[:total])
end
  
  