module Mustafa
  abstract class Model
      
    getter :db
    getter :log
    getter :session

    def initialize
      @db = Library::Database
      @log = Library::Log
      @session = Library::Session 
    end
  end
end
