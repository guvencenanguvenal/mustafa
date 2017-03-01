module Mustafa
    module Core
        abstract class Controller
            ###
            # only getter property
            ###
            getter :__actions

            ###
            # getter and setter property
            ###
            property :out
            property :params

            def initialize()
                @__actions = {} of String => Proc(Nil)
                
                @out = Http::Response.new
                @params = [] of String
            end

            ###
            # get controller instance
            ###
            def self.instance : Core::Controller
                Core.router.load_controller(self)
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
                Core.router.load_controller(self).__action__({{name}}) {{block}}
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
                Core.router.register_controller "#{{{controller_name}}}", {{controller_name.id}}.new()
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
            # this macro load ecr with parameters
            # load_view WelcomeView, "param1" : String, "param2" : String, "param3" : String
            #
            # this example for ECR View has 3 parameters
            # def initialize(@p1 : String, @p2 : String, @p3 : String)
            #
            # end
            ###
            macro load_view(ecr_classname, *variables)
                __loading_view = Core.loader.view({{ecr_classname}})

                Core.router.load_controller(self).out.output = __loading_view.to_s
            end

            ###
            # JSON is coming
            #
            # :TODO
            ###
            macro load_json(out_json)
                controller.out.json out_json
            end

        end
    end
end
