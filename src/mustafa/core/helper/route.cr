module Mustafa
  module Helper
    class Route
      INSTANCE = Route.new

      def path_split(path : String) : Array
        path_parse_array = [] of String

        path_parse_array = path.split('/')

        if path_parse_array.size > 1 #TODO
          path_parse_array.shift
          if path_parse_array.size == 1
            if path_parse_array[0].empty?
              path_parse_array[0] = "#{Mustafa::Config::MODULE_NAME}::#{Mustafa::Config::DEFAULT_CONTROLLER}"
            else
              path_parse_array[0] = "#{Mustafa::Config::MODULE_NAME}::#{path_parse_array[0].capitalize}"
            end
            path_parse_array.insert(1, "index")
          else path_parse_array.size == 2
            path_parse_array[0] = "#{Mustafa::Config::MODULE_NAME}::#{path_parse_array[0].capitalize}"
          end
        else
          path_parse_array.insert(0, "#{Mustafa::Config::MODULE_NAME}::#{Mustafa::Config::DEFAULT_CONTROLLER}")
          path_parse_array.insert(1, "index")
        end
                
        path_parse_array
      end
    end
    
    def self.route
      yield Route::INSTANCE
    end

    def self.route
      Route::INSTANCE
    end
  end
end
