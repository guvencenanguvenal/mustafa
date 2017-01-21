module Mustafa
  module Core
    ###
    # this class for register/load controller
    #
    # this class is singletone Mustafa::Core.route
    ###
    class Router
      INSTANCE = Router.new

      def initialize
        @__controllers = {} of String => Mustafa::Core::Controller
      end

      ###
      # Controller register and load methods
      # 
      # this method use polymorphysm
      ###
      def register_controller (name : String, controller : Mustafa::Core::Controller)
          @__controllers[name] = controller
          puts "Controller is registed : #{name}"
      end

      ###
      # this method for load controller with name
      #
      # Mustafa::Core.route.load_controller "Welcomecontroller"
      ###
      def load_controller (name : String) : Mustafa::Core::Controller
        @__controllers[name]
      end

      def controller? (name : String) : Bool
        @__controllers.has_key?(name)
      end
    end

    def self.router
      yield Router::INSTANCE
    end

    def self.router
      Router::INSTANCE
    end

  end
end
