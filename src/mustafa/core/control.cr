module Mustafa
  module Core
    abstract class Control

      ###
      #
      #
      ###
      abstract def show(**properties)      

      ###
      #
      #
      ##
      macro init(properties)
        @@props = { {{properties.id}} }
      end

      ###
      #
      #
      ###
      macro init_property(name)
        property {{name.id}} = ""
      end

      ###
      #
      #
      ###
      macro control_property(name)
        @{{name.id}} == "" ? @@props[:{{name.id}}] : @{{name.id}}
      end

    end
  end
end
