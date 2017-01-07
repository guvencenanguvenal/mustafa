module Mustafa
  module Core
    ###
    # this class for register/load controller
    #
    # this class is singletone Mustafa::Core.route
    ###
    class Router
      INSTANCE = Router.new

      getter :__controllers

      def initialize
        @__controllers = {} of String => Mustafa::Controller
      end

      ###
      # Controller register and load methods
      # Last Edit : 05.01.2017
      ###
      def register_controller (name : String, controller : Mustafa::Controller)
          @__controllers[name] = controller
          puts "Controller is registed : #{name}"
      end

      ###
      # this method for load controller with name
      #
      # Mustafa::Core.route.load_controller "Welcomecontroller"
      ###
      def load_controller (name : String) : Mustafa::Controller
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
