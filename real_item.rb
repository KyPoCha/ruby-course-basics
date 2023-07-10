class RealItem < Item
  attr_accessor :weight
  def initialize(options = nil)
    @weight = options[:weight]
    super(options[:name], options)
  end

  def info
    if block_given?
      yield weight.to_s, :weight.to_s
      super
    end
  end
end