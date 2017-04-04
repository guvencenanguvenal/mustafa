module Mustafa
    module Core
        abstract class Controller

            getter view : Mustafa::Core::View

            def initialize(actions : Hash(String, Proc(Nil)))
                @view = Mustafa::Notfoundview.new
                @__actions = actions
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
                Core::Helper.controller.register_controller "#{{{controller_name}}}", {{controller_name.id}}

                def initialize(actions : Hash(String, Proc(Nil)))
                    super(actions)
                end
            end

            macro action (name, &block)
                Core::Helper.controller.register_action(self, {{name}}) {{block}}
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
                    Mustafa::Library.log.add("There is no action : #{method_name}")
                    puts "There is no action : #{method_name}"
                    #show_404
                end
                rescue ex
                    Mustafa::Library.log.add("on Action Error Handling (#{method_name}) : #{ex.message}")
            end

            ###
            #
            ###
            def register_view(view_class : Mustafa::Core::View.class)
                @view = view_class.new
                puts "#{view_class} view is registed for #{self} controller!"
            end

            ###
            #
            ###
            def register_view(view_class : Mustafa::Core::View.class)
                @view = view_class.new
                yield @view
                puts "#{view_class} view is registed for #{self} controller!"
            end

            ###
            #
            ###
            def register_json(json_output : String)
                @view = JSONview.new(json_output)
                puts "JSON output for #{self} controller!"
            end

            ###
            #
            ###
            def load_view : Mustafa::Core::View
                @view.load
                @view
            end

        end
    end
end
