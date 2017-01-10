module Mustafa
  module Helper
    class Controller
      INSTANCE = Controller.new

      def controller_name?(c_name : String) : Bool
        if c_name.includes? '.'
          return false
        elsif c_name.includes? ','
          return false
        elsif c_name.includes? '/'
          return false
        end

        return true
      end

      def load_controller(controller_name = "#{Mustafa::Config::MODULE_NAME}::#{Mustafa::Config::DEFAULT_CONTROLLER}", method_name = "index") : Mustafa::Core::Controller
        if Core.router.controller? controller_name
          controller_obj = Core.router.load_controller controller_name

          if controller_obj == Nil
            puts "Controller is not found : #{controller_name}"
          else
            Mustafa::Core::Controller.run controller_obj, method_name
          end

          controller_obj
        else
          controller_obj = Core.router.load_controller "Mustafa::Notfoundcontroller"

          if controller_obj == Nil
            puts "Controller is not found : #{controller_name}"
          else
            Mustafa::Core::Controller.run controller_obj, method_name
          end

          controller_obj
        end
      end
    end

    def self.controller
      yield Controller::INSTANCE
    end

    def self.controller
      Controller::INSTANCE
    end
  end
end
