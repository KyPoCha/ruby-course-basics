require_relative '../module/item_container'
require_relative '../exception/item_not_supported_exception'
require_relative 'virtual_item'
require_relative 'antique_item'
require_relative 'item'

class Cart

  attr_reader :items
  include ItemContainer

  UNSUPPORTED_ITEM = [AntiqueItem, VirtualItem]

  def initialize(owner)
    @items = []
    @owner = owner
  end

  def save_to_file
    File.open(File.join(Dir.pwd, '/db/' + @owner.to_s + '_cart.txt'), 'w+') do |f|
      @items.each do |i|
        raise ItemNotSupported if UNSUPPORTED_ITEM.include? i.class
        f.puts i
      end
    end
  end

  def read_from_file
    # return unless File.exist? File.join(Dir.pwd, '/db/' + @owner.to_s + '_cart.txt')
    begin
    File.readlines(File.join(Dir.pwd, '/db/' + @owner.to_s + '_cart.txt'))
                 .each { |i| @items << i.to_real_item }
    @items.uniq
    rescue Errno::ENOENT
      File.open(File.join(Dir.pwd, '/db/' + @owner.to_s + '_cart.txt'), 'w+'){}
      puts "File #{@owner}_cart.txt is created"
    end
  end
end