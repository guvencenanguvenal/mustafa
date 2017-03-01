require "mongo"
require "json"

module Mustafa
    module Library
        module Database
            class Mongodb < Core::INoSQL

                def initialize(connection_string : String, db : String)
                    @client = Mongo::Client.new connection_string
                    @db = @client[db]
                end

                def insert(collection_name : String, insert_data : JSON)
                    collection = @db[collection_name]
                    collection.insert(insert_data)
                end

                def find(collection_name : String, find_data : JSON)
                    collection = @db[collection_name]
                    collection.find(insert_data)
                end

                def close
                    @db.close
                end
            end
        end
    end
end