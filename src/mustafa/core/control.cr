module Mustafa
  module Core
    abstract class Control

      ###
      # This method is helper to show your custom control
      # 
      ###
      abstract def show(**properties)      
      ###
      macro show(html)
        def show(**properties)
          {{html}}
        end
      end

      ###
      # initialize your custom control with properties
      #
      ##
      macro init(properties)
        @@props = { {{properties.id}} }
      end

      ###
      # initial your control's properties
      #
      ###
      macro init_property(name)
        property {{name.id}} = ""
      end

      ###
      # this macro is to use your properties on your custom control
      #
      ###
      macro control_property(name)
        @{{name.id}} == "" ? @@props[:{{name.id}}] : @{{name.id}}
      end

    end
  end
end
