require "http"

module Mustafa
    module Http
        class Request
            property method : String
            property headers : HTTP::Headers
            property body : IO?
            property body_str : String
            property version : String
            property path : String
            property query_string : String?
            property query_params : HTTP::Params
            
            def initialize(request : HTTP::Request)
                @method = request.method
                @path    = request.path.to_s
                @headers = request.headers
                @body    = request.body
                @body_str = ""
                @version = request.version
                @query_string = request.query
                @query_params = request.query_params
            end
        end
    end
end