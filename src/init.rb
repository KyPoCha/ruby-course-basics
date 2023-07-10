require_relative 'store_application'

# # Dir["*/2/*.rb"].each { |file| p file[14..] }
# Dir["*/2/*.rb"].each { |file| require_relative file[14..] unless file[14..].nil?}

StoreApplication.set do |app|
  app.name        = 'Ruby App'
  app.environment = :development
  app.admin do |admin|
    admin.email    = 'kirillpolishchuk02@gmail.com',
    admin.login    = 'admin'
    admin.password = 'zgoahvpjvlwdvjcg'
  end
end

puts StoreApplication.name
StoreApplication.name = 'New Name'

puts StoreApplication.name

@items = []
@items << VirtualItem.new('virtual',
                            price: 240,
                            weight: 290,
                          )
@items << AntiqueItem.new('antique',
                            price: 200,
                            weight: 200
                          )

@items << RealItem.new(name: 'car', price: 240, weight: 290)
@items << RealItem.new(name: 'bike', price: 270, weight: 300)
@items << RealItem.new(name:'cycle', price: 250, weight: 310)

cart = Cart.new("amg")
cart.add_item RealItem.new({
                            price: 240,
                            weight: 290,
                            name: 'car'
                          })
cart.add_item RealItem.new({
                             price: 240,
                             weight: 290,
                             name: 'bike'
                           })
cart.add_item RealItem.new({
                             price: 240,
                             weight: 290,
                             name: 'car'
                           })
p cart.send :all_cars

order = Order.new
@items.each { |el| order.add_item el }

# p Time.now.utc
# p Time.now.to_i
# order.place

# p cart.all_cars
# p cart.all_bikes
#
# p cart.kind_of? Cart
# p @items.first.kind_of? Item
#
# p @items.first.respond_to? :price
# p @items.first.send :tax
# p @items.first.tax

# cart = Cart.new
# item1 = Item.new({price: 200.0, height: 20, weight: 30})
# item2 = Item.new({price: 202.0, height: 20, weight: 20})
# item3 = Item.new({price: 3000.0, height: 30, weight: 30})
# item4 = Item.new({price: 401.0, height: 40, weight: 40})

# cart.add_item(Item.new({price: 10, height: 20, weight: 30, name: 'Toilet'}))
#
# cart.add_item(Item.new({price: 20, height: 20, weight: 20, name: 'Zasobnik'}))
#
# cart.add_item(Item.new({price: 30, height: 30, weight: 30, name: 'Card'}))
#
# cart.add_item(Item.new({price: 40, height: 40, weight: 40, name: 'OpenSource'}))
#
# cart.add_item(Item.new)
#
# p cart
#
# p cart.remove_item('Zasobnik')
#
# p cart
#
# cart.validate
#
# order = Order.new
# order.add_item item1
# order.add_item item2
# order.add_item item3
# order.add_item item4
# p order
#
# order.validate
# p order.count_valid_items
# # item = Item.new({price: 25, weight: 20, height: 20, name: 'Car'})
# # item.info { |value, info| puts info + ' ' + value}
# #
# # p item.real_price
# # p item.price
# # # item.info
# #
# #
# # p cart
# # cart.delete_invalid_items
# # p cart
# #
# # virtual_item = VirtualItem.new({price: 25, weight: 20, height: 20, name: 'Car'})
# # real_item = RealItem.new({weight: 20, name: 'Car'})
# #
# # p real_item
# #
# # # real_item.info { |value, info| puts info + ' ' + value  }
# #
# # # p Item.discount
# #
# # # p item.tax
# #
# # item = Item.new({price: 25, weight: 20, height: 20, name: 'Car'})
# # p item.price
# # p item.real_price
