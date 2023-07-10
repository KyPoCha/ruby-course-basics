module ItemContainer

  module ClassMethods
    MIN_PRICE = 5
    def min_price
      MIN_PRICE
    end
  end

  module InstanceMethods
    def add_item(item)
      @items.push(item) unless item.price < self.class.min_price
    end

    def pop_item
      @items.pop
    end

    def remove_item(item_name)
      tmp = []
      finded = nil
      i = 0

      while @items.length > i && !@items[i].nil?
        if @items[i].name == item_name
          finded = @items[i]
        else
          tmp.push @items[i]
        end
        i+=1
      end

      if finded.nil?
        'There is no item named: ' + item_name.to_s
      else
        @items = tmp
        finded
      end
    end

    def validate
      @items.each do |item|
        puts '| Item ' + item.itself.to_s + ' has no price |' if item.price.nil?
        puts '| Item ' + item.itself.to_s + ' has no height|' if item.height.nil?
        puts '| Item ' + item.itself.to_s + ' has no weight|' if item.weight.nil?
        puts '| Item ' + item.itself.to_s + ' has no name  |' if item.name.nil?
      end
    end

    def delete_invalid_items
      @items.delete_if { |i| i.price.nil?}
    end

    def count_valid_items
      @items.count { |it| it.price }
    end

    def method_missing(method_name)
      method_name =~ /^all_/ ? show_all_item_with_name(method_name.to_s.
        sub(/^all_/, '').chomp('s'))
             : super
    end

    private def show_all_item_with_name(name)
      @items.map{|el| el if el.name == name}.compact
    end
  end

  def self.included(classes)
    classes.extend ClassMethods
    classes.class_eval { include InstanceMethods }
  end

end