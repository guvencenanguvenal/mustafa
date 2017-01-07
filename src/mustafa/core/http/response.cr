module Mustafa
    module Http
        class Response  
            property output : String
            property content_type : String
            property content_length : Int32

            def initialize
                @output = ""
                @content_type = "text/html"
                @content_length = 1000
            end

            def initialize (output : String, content_type : String, content_length : Int32)
                @output = output
                @content_type = content_type
                @content_length = content_length
            end

            def text (str : String)
                @output = str
            end

            def html (str : String)
                @output = str
                @content_type = "text/html"
            end

        end
    end
end