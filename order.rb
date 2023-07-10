require_relative 'item_container'

class Order

  attr_reader :items

  include ItemContainer

  def initialize
    @items = []
  end

  def place
    Pony.mail({
      to: StoreApplication::Admin.email,
      from: 'My Store <mail@gmail.com>',
      via: :smtp,
      via_options: {
        address: 'smtp.gmail.com',
        port: '587',
        enable_starttls_auto: true,
        user_name: StoreApplication::Admin.email,
        password: StoreApplication::Admin.password,
        domain: 'google.com',
        authentication: :plain,
      },
      subject: 'New order was added',
      body: 'Check your account'
              })
  end

end