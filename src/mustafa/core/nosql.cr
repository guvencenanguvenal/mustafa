module Mustafa
    module Core
        ###
        # this class is abstract to create database class.
        ###
        abstract class INoSQL
            # Pls open connection on initialize method

            ###
            # this method is to run query
            ###
            abstract def collection(colletion_string : String)

            ###
            # find datas
            ###
            abstract def find(find_json : JSON)
            ###
            # insert table
            ###
            abstract def insert(insert_json : JSON)

            ###
            # delete from table where
            ###
            abstract def delete(table : String, where = "false")

            ###
            # close connection
            # HINT: Pls open connection with initialize method
            ###
            abstract def close
            
        end
    end
end
