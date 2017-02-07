module Mustafa
    module Library
        module DatabaseType
            ###
            # this class DUMMY database connection that is to say Null Database
            ###
            class Dummy < Core::DB

                def open(connection_string : String)

                end

                def query(query_string : String) : Array(Hash(String, String))
                    Array(Hash(String, String)).new
                end

                def select(select_columns : String, from : String, where = "true") : Array(Hash(String, String))
                    Array(Hash(String, String)).new
                end

                def select_all(from : String, where = "true") : Array(Hash(String, String))
                    Array(Hash(String, String)).new
                end

                def select_table_count(table : String)
                    0
                end

                def select_count(table : String, where : String)
                    0
                end

                def insert(table : String, values : Array(DB::Any))
                    
                end

                def delete(table : String, where = "false")
                    
                end

                def close
                    
                end
            end
        end
    end
end