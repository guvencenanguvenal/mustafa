module Mustafa
  module Core
    abstract class Model
        
      getter :db
      getter :log
      getter :session

      def initialize
        @db = Library::Database.new
        @log = Library::Log.new
        @session = Library::Session.new 
      end
    end
  end
end
