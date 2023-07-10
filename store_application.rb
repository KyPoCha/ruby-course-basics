class StoreApplication

  class << self
    attr_accessor :name, :environment

    def set
      unless @store
        yield self
        puts 'loading classes'
        require_relative 'cart'
        require_relative 'item'
        require_relative 'real_item'
        require_relative 'virtual_item'
        require_relative 'string'
        require_relative 'antique_item'
        require_relative 'order'
        require 'active_support/core_ext/array'
        require 'pony'
        end
      @store ||= self
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