module Mustafa
  module Core
    module Helper
      class Session
        INSTANCE = Session.new

        @_lib : Core::Library | Nil

        def initialize
          @_lib = Helper.library.load_library(Mustafa::Library::Session)

          if !@_lib
            Mustafa::Library.log.add("Library is not found on Session Helper! Session.class", Mustafa::LogType::Application.value)
            raise "Library is not found!"
          end 
        end

        def set_session_data(session_data : Hash(String, String))
          @_lib.as(Mustafa::Library::Session).session_data = session_data
        end

        def get_session_data : Hash(String, String)
          @_lib.as(Mustafa::Library::Session).session_data
        end
      end
      
      def self.session
        yield Session::INSTANCE
      end

      def self.session
        Session::INSTANCE
      end
    end
  end
end
