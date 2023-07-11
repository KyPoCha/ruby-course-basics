require_relative 'item'
class RealItem < Item
  attr_accessor :weight
  show_info_about :weight, lambda {|attr| attr > 10}

  def initialize(options = nil)
    @weight = options[:weight]
    super(options[:name], options)
  end

  def info
    if block_given?
      if @@show_info_about[:weight].call(weight) || !@@show_info_about[:weight]
        yield weight
      end
      super
    end
  end
end