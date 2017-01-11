module Mustafa
    module Core
        abstract class Controller
            getter :__actions

            property :out
            property :params

            def initialize
            @__actions = {} of String => Proc(Nil)

            @out = Http::Response.new
            @params = [] of String
            end

            ###
            # this macro use for controller actions defined
            #
            #  class WelcomeController < Controller
            #   register WelcomeController
            #   
            #   action "action_name" do
            #       &block
            #   end
            #  end
            #
            ###
            macro action (name, &block)
                @@this.__action__({{name}}) {{block}}
            end

            def __action__(name : String, &block)
                @__actions[name] = block
                puts "Action is registed. #{name}"
            end

            ###
            #   this macro registed controller on system
            #  
            #   class WelcomeController < Controller
            #       init WelcomeController
            #       ...
            #   end
            ###
            macro init(controller_name)
                @@this = {{controller_name.id}}.new
                Core.router.register_controller "#{{{controller_name.id}}}", @@this
            end

            ###
            # this macro load action
            # 
            # action is controller method on Mustafa
            # 
            # Example for use;
            # Mustafa::Controller.run Welcomecontroller, "index"
            ###
            macro run (controller, name)
                {{controller}}.__run_action__({{name}})
            end

            def __run_action__(method_name : String)
                if @__actions.has_key?(method_name)
                    if callback = @__actions[method_name]
                        callback.call
                    end
                else
                    puts "There is no action : #{method_name}"
                    #show_404
                end
            end

            ###
            # this macro load ecr with parameters
            # load_ecr WelcomeView, "param1", "param2", "param3"
            #
            # this example for ECR View has 3 parameters
            # def initialize(@p1 : String, @p2 : String, @p3 : String)
            #
            # end
            ###
            macro load_ecr(ecr_classname, *variables)
                @@this.out.output = {{ecr_classname}}.new({% for variable, index in variables %} {{variable}}, {% end %}).to_s
            end

            ###
            # JSON is coming
            #
            # :TODO
            ###

        end
    end
end
