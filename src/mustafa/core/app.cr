module Mustafa
  module Core
    ###
    # App is base class for Mustafa
    # This class is singletone. Mustafa::Core.app
    ###
    class App
            
      INSTANCE = App.new

      ###
      #
      ###
      private def initialize_framework
        initialize_controllers
        initialize_models
        initialize_libraries
      end

      private def initialize_controllers
        Helper.controller.__controller_names.each do |key, value|
          Helper.controller.__controllers[value] = key.new(Helper.controller.__tmp_actions[key])
        end

        Helper.controller.__tmp_actions.clear
        #Core.router.__controller_names.clear
      end

      private def initialize_models
        Helper.model.__models.each do |key, value|
          scope = Helper.model.get_model_scope(key)
          if scope == Model::Scope::Singleton
            Helper.model.__models_obj[key] = value.new
          elsif scope == Model::Scope::Prototype
            Helper.model.__models_obj[key] = value.new
          end
        end
      end

      private def initialize_libraries
        Helper.library.__libraries_class.each do |key, value|
          scope = Helper.library.get_library_scope(key)
          if scope == Library::Scope::Singleton
            Helper.library.__libraries_obj[key] = value.new
          end
        end
      end

      ###
      # HTTP Connect methods
      #
      ###
      def serve(port)
        initialize_framework
        puts "Mustafa is initialized!"

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
