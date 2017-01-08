module Mustafa
  module Core
    ###
    # App is base class for Mustafa
    # This class is singletone. Mustafa::Core.app
    ###
    class App
            
      INSTANCE = App.new
      
      def initialize

      end

      ###
      # HTTP Connect methods
      #
      ###
      def serve(port)
        server = HTTP::Server.new (port) do |context| 
            request = Http::Request.new context.request

            Mustafa::Helper.route.set_query_params request.method.to_s, request.query_string.to_s
            path_parse_array = Mustafa::Helper.route.path_split request.path

            controller_obj = Mustafa::Helper.controller.load_controller path_parse_array[0]
            Mustafa::Controller.run controller_obj, path_parse_array[1]

            context.response.content_type = controller_obj.out.content_type
            context.response.print controller_obj.out.output
        end

        server.listen
      end
    end

    def self.app
        yield App::INSTANCE
    end

    def self.app
        App::INSTANCE
    end

  end
end
