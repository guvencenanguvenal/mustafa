require "http"

module Mustafa
    module Http
        class Handler < HTTP::Handler
            def call(context)     
                request = Http::Request.new context.request
                response = Http::Response.new

                Helper.route.set_query_params request.method.to_s, request.query_string.to_s
                path_parse_array = Helper.route.path_split request.path
                Helper.route.set_url_params request.path

                if Helper.controller.controller_name? path_parse_array[0]
                    Helper.session.set_session_data context.session

                    controller_obj = Helper.controller.load_controller path_parse_array[0]
                    Core::Controller.run controller_obj, path_parse_array[1]
                                    
                    context.session = Helper.session.get_session_data
                
                    context.response.content_type = controller_obj.out.content_type
                    context.response.print controller_obj.out.output
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