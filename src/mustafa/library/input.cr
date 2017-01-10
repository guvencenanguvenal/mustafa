module Mustafa
    module Library
        class Input

            INSTANCE = Input.new

            def get(key : String) : String
                Input.get.value(key)
            end

            def get_array(key : String) : Array(String)
                Input.get.value_array(key)
            end

            def post(key : String) : String
                Input.post.value(key)
            end

            def post_array(key : String) : Array(String)
                Input.post.value_array(key)
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