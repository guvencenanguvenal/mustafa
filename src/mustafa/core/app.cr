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
        server = HTTP::Server.new Config::LOCALHOST_ADDRESS, port, [
          HTTP::ErrorHandler.new,
          HTTP::LogHandler.new,
          Http::Session::Handler.new,
          Http::Handler.new,
          HTTP::StaticFileHandler.new("", false),
        ] 
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
