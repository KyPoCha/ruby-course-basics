class Item

  attr_reader :real_price
  attr_accessor :price, :name

  @@discount = 0.1

  def initialize(options = {})
    @real_price = options[:price]
    @name = options[:name]
    @price = options[:price]
  end

  def info
    if block_given?
      yield price.to_s, :price.to_s
      yield height.to_s, :height.to_s
      yield weight.to_s, :weight.to_s
      yield name.to_s, :name.to_s
    else
      puts 'Nothing to show'
    end
  end

  def self.discount
    if Time.now.month == 7
      @@discount += 0.3
    else
      @@discount
    end
  end

  def price
    (@real_price - @real_price * self.class.discount) + tax unless @real_price.nil?
  end

  def to_s
    "#{self.name}:#{self.price}:#{self.weight}"
  end

  private def tax
    type_tax = self.class == VirtualItem ? 1 : 2

    cost_tax = @real_price > 5 ? @real_price * 0.2 : @real_price * 0.1
    cost_tax.to_i + type_tax.to_i
  end

end