module Mustafa
    module Library
        class Session < Core::Library
            init Session, Core::Library::Scope::Singleton

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
    end
end