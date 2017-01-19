module Mustafa
  module Core
    abstract class Usercomponent
      
      macro init_component(name, content)
        def self.{name.id}
          {content}
        end
      end

      macro prop(name, value)
        @@{name.id} = {value}
        
        def self.{name.id}

        end
      end
 
    end
  end
end
