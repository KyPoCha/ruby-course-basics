require 'rspec'
require_relative '../src/model/item'
require_relative '../src/model/virtual_item'

describe Item do

  # before(:each) do
  #   @item = Item.new('car', price: 300)
  # end

  before(:all) do
    @item = Item.new('car', price: 300)
  end

  after(:each) do
    @item_2 = Item.new('bike', price: 300)
  end

  it "should calculate correctly price" do
    expect(@item.price).to be 332.0
  end

  it 'should return correctly info about object' do
    expect(@item.to_s).to include('car:332.0')
  end
end