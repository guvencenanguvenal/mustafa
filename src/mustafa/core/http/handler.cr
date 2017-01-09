require "http"

module Mustafa
    module Http
        class Handler < HTTP::Handler

            def call(context)     
                request = Http::Request.new context.request

                Mustafa::Helper.route.set_query_params request.method.to_s, request.query_string.to_s
                path_parse_array = Mustafa::Helper.route.path_split request.path

                controller_obj = Mustafa::Helper.controller.load_controller path_parse_array[0]
                Mustafa::Controller.run controller_obj, path_parse_array[1]

                context.response.content_type = controller_obj.out.content_type
                context.response.print controller_obj.out.output

                call_next(context)
            end

        end
    end
end