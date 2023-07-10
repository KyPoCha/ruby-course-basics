require_relative '../module/item_container'

class Order

  attr_reader :items

  include ItemContainer

  def initialize
    @items = []
  end

  def place
    thread = Thread.new do
      Pony.mail({
        to: 'annpol78@gmail.com',
        from: 'My Store <mail@gmail.com>',
        via: :smtp,
        via_options: {
          address: 'smtp.gmail.com',
          port: '587',
          enable_starttls_auto: true,
          user_name: 'kirillpolishchuk02@gmail.com',
          password: StoreApplication::Admin.password,
          domain: 'google.com',
          authentication: :plain,
        },
        subject: 'New order was added',
        body: 'Check your account'
                })
    end
    while thread.alive?
      puts '...'
      sleep 0.5
    end
  end
end