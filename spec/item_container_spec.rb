require 'rspec'
require_relative '../src/module/item_container'

class ItemsContainer
  include ItemContainer
  def initialize
    @items = []
  end
end

describe ItemsContainer do
  before(:all) do
    @container = ItemsContainer.new
    @item1 = Item.new('car', price: 300)
    @item2 = Item.new('bike', price: 320)

    @container.add_item(@item1)
    @container.add_item(@item2)
  end

  it 'should add items to container' do
    expect(@container.items.size).to eq 2
  end

  it 'should remove item from container' do
    @container.remove_item(@item1.name)
    expect(@container.items).to include(@item2)

    expect(@container.items.size).to eq 1

    @container.remove_item(@item2.name)

    expect(@container.items).to be_empty
  end
end