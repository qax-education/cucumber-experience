Dado('que iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end
  
Quando('faço a busca do seguinte CEP: {string}') do |zipcode|
    @checkout.find_zipcode(zipcode)
end

Quando('informo os demais dados do endereço:') do |table|
    @checkout.fill_address(table.rows_hash)
end

Quando('escolho a forma de pagamento {string}') do |payment_type|
    @checkout.choice_payment(payment_type)
end

Quando('por fim finalizo a compra') do
    @checkout.submit
end

Então('sou redicionado para a página de confirmação de Pedidos') do
    @order.assert_order
end

Então('deve ser informando o seguinte prazo e entrega: {string}') do |delivery_time|
    @order.assert_delivery_time(delivery_time)
end