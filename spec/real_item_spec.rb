require 'rspec'
require_relative '../src/model/real_item'
require_relative '../src/model/item'
require_relative '../src/model/antique_item'
require_relative '../src/model/virtual_item'

describe RealItem do

  context 'when return info about' do

    it 'should use weight if the conditional is true' do
      item1 = RealItem.new({name: 'car', price: 200, weight: 5})
      item2 = RealItem.new({name: 'bike', price: 250, weight: 12})

      item_info1 = []
      item_info2 = []

      item1.info { |attr| item_info1 << attr}
      item2.info { |attr| item_info2 << attr}

      expect(item_info1.join(',')).to include('200,car')
      expect(item_info2.join(',')).to include('12,250,bike')
    end

  end

end