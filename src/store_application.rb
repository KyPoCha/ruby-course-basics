class StoreApplication

  class << self
    attr_accessor :name, :environment

    def set
      unless @store
        yield self
        puts 'loading classes'
        require_relative 'model/cart'
        require_relative 'model/item'
        require_relative 'model/real_item'
        require_relative 'model/virtual_item'
        require_relative 'util/string'
        require_relative 'model/antique_item'
        require_relative '/model/order'
        require 'active_support/core_ext/array'
        require 'pony'
        end
      @store ||= self
      # @store.freeze
    end

    def admin(&block)
      @admin ||= Admin.new(&block)
    end
  end
  class Admin
    class << self
      attr_accessor :email, :login, :password

      def new
        unless @store
          yield self
        end
        @store ||= self
      end
    end

  end
end