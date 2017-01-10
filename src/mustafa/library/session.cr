module Mustafa
    module Library
        class Session

            INSTANCE = Session.new

            property session_data : Hash(String, String)

            def initialize
                @session_data = Hash(String, String).new
            end

            def get(key : String) : String | Nil
                @session_data[key]?
            end

            def set(key : String, value : String)
                @session_data[key] = value
            end
        end

        def self.session
            yield Session::INSTANCE
        end

        def self.session
            Session::INSTANCE
        end

    end
end