require "db"

module Mustafa
    module Library
        class Database

            @@db = Library::DatabaseType::Dummy.new.as(Core::DB)

            ###
            # open connection method
            #
            # Library::Database.open  or  Library::Database.open("mysql://#{user}@#{host}/#{schema}", Library::DatabaseType::Mysql)
            ###
            def self.open(connection_string = "mysql://root@localhost/localhost", db_class = Library::DatabaseType::Mysql)
                @@db = db_class.new(connection_string).as(Core::DB)
                rescue DB::ConnectionRefused
                    Library.log.add("Database is not conneting : DB Type : #{db_class}", LogType::System.value)
            end

            ###
            # this method get database instance
            #
            # Library::Database.db.select_all("test") //select * from test
            ###
            def self.db : Core::DB
                @@db
            end

            ###
            # close connection
            #
            # Library::Database.close
            ###
            def self.close
                @@db.close
            end

        end
    end
end