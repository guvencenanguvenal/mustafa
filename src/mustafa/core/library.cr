module Mustafa
    module Core
        ###
        # this class is abstract to create library class.
        ###
        abstract class Library

            enum Scope
                Singleton
                Request
            end
            ###
            # this macro is to register libraries 
            ###
            macro init(library_name, scope = Scope::Request)
                Mustafa::Core::Helper.library.register_library {{library_name.id}}, {{scope.id}}
            end
            
        end
    end
end
