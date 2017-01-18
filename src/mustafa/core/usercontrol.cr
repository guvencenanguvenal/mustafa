module Mustafa
  module Core
    abstract class Usercontrol
      
      macro init_control(name, content)
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
