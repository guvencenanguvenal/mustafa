module Mustafa
    module Core
        abstract class Controller
            ###
            # only getter property
            ###
            getter :__actions
            getter :__name

            ###
            # getter and setter property
            ###
            property :out
            property :params

            ###
            # controller is as a service
            ###
            @__is_service : Bool

            def initialize(name : String, is_service = false)
                @__actions = {} of String => Proc(Nil)
                
                @out = Http::Response.new
                @params = [] of String

                @__name = name
                @__is_service = is_service
            end

            ###
            # controller is as a service
            ###
            def service? : Bool
                return @__is_service
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
                INSTANCE.__action__({{name}}) {{block}}
            end

            protected def __action__(name : String, &block)
                if !@__actions.has_key?(name)
                    @__actions[name] = block
                    puts "Action is registed. #{name}"
                else
                    Library.log.add("Action is already exist.")
                    puts "Action is already exist."
                end
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
                def initialize(name : String, is_service = false)
                    super(name, is_service)
                end

                INSTANCE = {{controller_name.id}}.new("#{{{controller_name}}}")
                Core.router.register_controller INSTANCE.__name, INSTANCE
            end

            ###
            #
            #
            ###
            macro init_as_a_service(controller_name)
                def initialize(name : String, is_service : Bool)
                    super(name, is_service)
                end

                INSTANCE = {{controller_name.id}}.new("#{{{controller_name}}}", true)
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
                    Library.log.add("There is no action : #{method_name}")
                    puts "There is no action : #{method_name}"
                    #show_404
                end
                rescue ex
                    Mustafa::Library.log.add("on Action Error Handling (#{method_name}) : #{ex.message}")
            end

            ###
            # for init simple view page
            # this view is non-parametric
            ###
            macro init_base_view(name, filename)
                class {{name}} < Core::View
                    ECR.def_to_s {{filename}}

                    def load

                    end
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
