module Mustafa
    module Library
        class Session < Core::Library
            init Session, Core::Library::Scope::Singleton

            def get(key : String) : String | Nil
                Core::Helper.session.session_data[key]?
            end

            def set(key : String, value : String)
                Core::Helper.session.session_data[key] = value
            end
        end
    end
end