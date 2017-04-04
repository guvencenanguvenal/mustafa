module Mustafa
    module Library
        class Input

            INSTANCE = Input.new

            def get(key : String) : String
                Input.get[key]
            end

            def get(key : String, index : Int32) : Array(String)
                Input.get[key, index]
            end

            def post(key : String) : String
                Input.post[key]
            end

            def post_array(key : String) : Array(String)
                Input.post[key]
            end

            def params(index : Int32) : String
                Input.params[index]
            end
        end

        def self.input
            yield Input::INSTANCE
        end

        def self.input
            Input::INSTANCE
        end

    end
end