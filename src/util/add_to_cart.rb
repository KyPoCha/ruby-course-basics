require_relative '../init'

owner = ARGV.delete_at 0
cart = Cart.new(owner)

ARGV.each do |arg|
  @items.each { |obj| cart.add_item obj if obj.name.downcase == arg }
end

cart.read_from_file
#
# p cart.items
begin
  cart.save_to_file
rescue ItemNotSupported
  puts "You have UnsupportedItem in your cart" + "\nUnsupported Item types: #{Cart::UNSUPPORTED_ITEM}"
end