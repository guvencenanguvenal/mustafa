require "http"

module Mustafa
  module Core
    ###
    # App is base class for Mustafa
    # This class is singletone. Mustafa::Core.app
    ###
    class App
            
      INSTANCE = App.new

      getter :header
      getter :body
      getter :method
      getter :path
      getter :query

      def initialize
          @method = ""
          @path = ""
          @query = ""
      end

      ###
      # HTTP Connect methods
      #
      ###
      def serve(port=8080)
          server = HTTP::Server.new(Mustafa::Config::LOCALHOST_ADDRESS, port) do |context| 
              #@header = context.request.headers
              #@body = context.request.body
              @method = context.request.method
              puts @method
              @path = context.request.path.to_s
              puts @path
              #@query = context.request.query

              path_parse_array = Mustafa::Helper.route.path_split @path

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
