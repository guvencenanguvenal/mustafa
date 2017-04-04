require "http"

module Mustafa
    module Http
        class Handler

            include HTTP::Handler

            def call(context)
                if Core::Helper.controller.controller_name? context.request.path
                    Core::Helper.session.set_session_data context.session

                    Core.router.route_controller context
                                    
                    context.session = Core::Helper.session.get_session_data

                    context
                else
                    ##
                    # if next handler is already exist
                    ##
                    if next_handler = @next
                        next_handler.call(context)
                    end
                end
            end
        end
    end
end