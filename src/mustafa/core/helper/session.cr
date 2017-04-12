module Mustafa
  module Core
    module Helper
      class Session
        INSTANCE = Session.new

        property session_data : Hash(String, String)

        def initialize
            @session_data = Hash(String, String).new
        end

        def set_session_data(session_data : Hash(String, String))
          @session_data = session_data
        end

        def get_session_data : Hash(String, String)
          @session_data
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
