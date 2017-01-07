module Mustafa
  module Helper
    class Controller
      INSTANCE = Controller.new

      def load_controller(controller_name = "#{Mustafa::Config::MODULE_NAME}::#{Mustafa::Config::DEFAULT_CONTROLLER}", method_name = "index") : Mustafa::Controller
        if Core.router.controller? controller_name
          controller_obj = Core.router.load_controller controller_name

          if controller_obj == Nil
            puts "Controller is not found : #{controller_name}"
          else
            Mustafa::Controller.run controller_obj, method_name
          end

          controller_obj
        else
          controller_obj = Core.router.load_controller "Mustafa::Notfoundcontroller"

          if controller_obj == Nil
            puts "Controller is not found : #{controller_name}"
          else
            Mustafa::Controller.run controller_obj, method_name
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
