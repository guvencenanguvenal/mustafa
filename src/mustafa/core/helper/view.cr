module Mustafa
  module Core
    module Helper
      class View
        INSTANCE = View.new
        
        def add_param(key : String, value : String, obj : Core::View)
          obj.add_param(key, value)
        end
        
        def add_array(key : String, value : Array(String), obj : Core::View)
          obj.add_array(key, value)
        end

      end

      def self.view
        yield View::INSTANCE
      end

      def self.view
        View::INSTANCE
      end
    end
  end
end
