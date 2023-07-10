require 'rspec'
require_relative '../src/model/item'
require_relative '../src/model/virtual_item'

describe Item do
  it "should calculate correctly price" do
    item = Item.new('car', price: 300)
    expect(item.price).to be 242.0
  end
end