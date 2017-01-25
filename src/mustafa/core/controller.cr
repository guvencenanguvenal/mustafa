module Mustafa
    module Core
        abstract class Controller
            getter :__actions
            getter :__name

            property :out
            property :params

            def initialize
                @__actions = {} of String => Proc(Nil)
                @__name = ""

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
                INSTANCE.__actions[{{name}}] = {{block}}
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
                INSTANCE = {{controller_name.id}}.new
                INSTANCE.__name = "#{{{controller_name}}}"
                Core.router.register_controller INSTANCE.__name, INSTANCE
            end

            ###
            # this macro load action
            # 
            # action is controller method on Mustafa
            # 
            # Example for use;
            # Mustafa::Controller.run Welcomecontroller, "index"
            ###
            def run_action(method_name : String)
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
            # this macro load your model
            # 
            # Example for use;
            # load_model "Welcomemodel"
            #
            # welcomemodel.yourmodelmethod
            ###
            macro load_model(model_name)
                {{model_name.downcase.id}} = {{model_name.id}}.new
            end

            ###
            # this macro load ecr with parameters
            # load_view WelcomeView, "param1", "param2", "param3"
            #
            # this example for ECR View has 3 parameters
            # def initialize(@p1 : String, @p2 : String, @p3 : String)
            #
            # end
            ###
            macro load_ecr(ecr_classname, *variables)
                __loading_view = {{ecr_classname}}.new({% for variable, index in variables %} {{variable}}, {% end %})
                __loading_view.load

                INSTANCE.out.output = __loading_view.to_s
            end

            ###
            # JSON is coming
            #
            # :TODO
            ###

        end
    end
end
