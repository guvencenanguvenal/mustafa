module Mustafa
    module Core
        ###
        # this class is abstract to create database class.
        ###
        abstract class IDatabase
            # Pls open connection on initialize method

            ###
            # this method is to run query
            ###
            abstract def query(query_string : String) : Array(Hash(String, String))

            ###
            # this method is to select following columns from table
            ###
            abstract def select(select_columns : String, from : String, where = "true") : Array(Hash(String, String))

            ###
            # this method is to select * from table
            ###
            abstract def select_all(from : String, where = "true") : Array(Hash(String, String))

            ###
            # this method get table row count
            ###
            abstract def select_table_count(table : String)

            ###
            # this method get "where" following table row count
            ###
            abstract def select_count(table : String, where : String)

            ###
            # insert table
            ###
            abstract def insert(table : String, values : Array(DB::Any))

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
