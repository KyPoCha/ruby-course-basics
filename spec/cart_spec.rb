require 'rspec'
require_relative '../src/model/cart'
require_relative '../src/module/item_container'
require_relative '../src/model/virtual_item'
require_relative '../src/model/antique_item'
require_relative '../src/model/item'

describe Cart do
  it "should add items to Cart" do
    cart = Cart.new('kyrylo')
    item1 = Item.new('car', price: 300)
    item2 = Item.new('bike', price: 400)
    item3 = Item.new('cycle', price: 500)

    cart.add_item(item1, item2, item3)
    expect(cart.items).to include(item1, item2, item3)
  end
end
