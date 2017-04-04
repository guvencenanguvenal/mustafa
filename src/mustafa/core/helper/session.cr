module Mustafa
  module Core
    module Helper
      class Session
        INSTANCE = Session.new

        def set_session_data(session_data : Hash(String, String))
          Mustafa::Library.session.session_data = session_data
        end

        def get_session_data : Hash(String, String)
          Mustafa::Library.session.session_data
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
