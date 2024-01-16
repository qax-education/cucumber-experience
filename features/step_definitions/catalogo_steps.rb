Quando('acesso a página principal da Starbugs') do
  @home.open
end

Então('eu devo ver uma lista de cafés disponíveis') do
  expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página principal da Starbugs') do
  @home.open
end

Dado('que desejo comprar o seguinte produto:') do |table|
  @product = table.rows_hash
end

Quando('inicio a compra desse item') do
  @home.buy(@product[:name])
end

Então('devo ver a página de Checkout com os detalhes do produto') do
  @checkout.assert_product_details(@product)
end

Então('o valor total da compra deve ser de {string}') do |total_price|
  @checkout.assert_total_price(total_price)
end

Então('devo ver um popup informando que o produto está indisponível') do
  @popup.have_text('Produto indisponível')
end
