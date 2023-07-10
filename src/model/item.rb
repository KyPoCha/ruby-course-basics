class Item

  attr_reader :real_price
  attr_accessor :name

  @@discount = 0.1

  def initialize(name,options = {})
    @real_price = options[:price]
    @name = name
  end

  def info
    if block_given?
      yield real_price.to_s, :real_price.to_s
      yield name.to_s, :name.to_s
    else
      puts 'Nothing to show'
    end
  end

  def self.discount
    if Time.now.month == 6
      @@discount += 0.03
    else
      @@discount
    end
  end

  def price
    (@real_price - @real_price * self.class.discount) + tax unless @real_price.nil?
  end

  def price=(value)
    @real_price = value
  end

  def to_s
    "#{self.name}:#{self.price}#{':' + self.weight if self.respond_to? :weight}"
  end

  private def tax
    type_tax = self.class == VirtualItem ? 1 : 2

    cost_tax = @real_price > 5 ? @real_price * 0.2 : @real_price * 0.1
    cost_tax.to_i + type_tax.to_i
  end

end