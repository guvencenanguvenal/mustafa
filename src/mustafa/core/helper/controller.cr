module Mustafa
  module Core
    module Helper
      class Controller
        INSTANCE = Controller.new

        property :__tmp_actions
        property :__controller_names
        property :__controllers

        def initialize
          @__controllers = {} of String => Mustafa::Core::Controller
          @__controller_names = {} of Mustafa::Core::Controller.class => String
          @__tmp_actions = {} of Mustafa::Core::Controller.class => Hash(String, Proc(Nil))
        end
        
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

        ###
        # Controller register and load methods
        # 
        # this method use polymorphysm
        ###
        def register_controller (name : String, controller_class : Mustafa::Core::Controller.class)
          @__controller_names[controller_class] = name
          @__tmp_actions[controller_class] = Hash(String, Proc(Nil)).new
          puts "Controller is registed : #{name}"
        end

        def register_action (controller_class : Mustafa::Core::Controller.class, name : String, &block)
          if !@__tmp_actions[controller_class].has_key?(name)
              @__tmp_actions[controller_class][name] = block
              puts "Action is registed. #{name}"
          else
              Mustafa::Library.log.add("Action is already exist.")
              puts "Action is already exist."
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
end
