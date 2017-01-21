module Mustafa
  module Helper
    class Controller
      INSTANCE = Controller.new

      def controller_name?(path : String) : Bool
        path_parse_array = [] of String

        path_parse_array = path.split('/')

        if path_parse_array.last(1).includes?('.') | path_parse_array.last(1).includes?(',')
          return false
        end

        i = 0
        while (i < path_parse_array.size)
          if path_parse_array[i].includes?('.') | path_parse_array[i].includes?(',')
            return false
          end
          i += 1
        end

        return true
      end

      def load_controller(controller_name = "#{Mustafa::Config::MODULE_NAME}::#{Mustafa::Config::DEFAULT_CONTROLLER}", method_name = "index") : Mustafa::Core::Controller
        if Core.router.controller? controller_name
          controller_obj = Core.router.load_controller controller_name

          if controller_obj == Nil
            puts "Controller is not found : #{controller_name}"
          else
            controller_obj.run_action method_name
          end

          controller_obj
        else
          controller_obj = Core.router.load_controller "Mustafa::Notfoundcontroller"

          if controller_obj == Nil
            puts "Controller is not found : #{controller_name}"
          else
            controller_obj.run_action method_name
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