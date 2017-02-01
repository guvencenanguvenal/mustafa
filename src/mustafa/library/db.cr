require "db"

module Mustafa
    module Library
        class Database

            @@db = Library::DatabaseLibrary::Dummy.new.as(Core::DB)

            ###
            # open connection method
            #
            # Library::Database.open  or  Library::Database.open("localhost", "username", "password", "schemaname")
            ###
            def self.open(host = "localhost", user = "root", pass = "", schema = "localhost")
                @@db = Library::DatabaseLibrary::Mysql.new(host, user, pass, schema)
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