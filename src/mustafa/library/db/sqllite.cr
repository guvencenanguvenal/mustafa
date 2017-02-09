module Mustafa
    module Library
        module Database
            class Sqlite < Core::DB

                def initialize(connection_string = "sqlite3://./data.db")
                    @db = DB.open connection_string
                end

                def query(query_string : String) : Array(Hash(String, String))
                    read_query_result(query_string)
                end

                def select(select_columns : String, from : String, where = "true") : Array(Hash(String, String))
                    read_query_result("select #{select_columns} from #{from} where #{where}")
                end

                def select_all(from : String, where = "true") : Array(Hash(String, String))
                    read_query_result("select * from #{from} where #{where}")
                end

                def select_table_count(table : String)
                    @db.scalar "select max(*) from #{table}"
                end

                def select_count(table : String, where : String)
                    @db.scalar "select max(*) from #{table} where #{where}"
                end

                def insert(table : String, values : Array(DB::Any))
                    @db.exec "insert into #{table} values (?, ?)", values
                end

                def delete(table : String, where = "false")
                    @db.exec "delete from #{table} where #{where}"
                end

                def close
                    @db.close
                end

                private def read_query_result(query_string : String) : Array(Hash(String, String))
                    ret_val = Array(Hash(String, String)).new

                    @db.query query_string do |rs|
                        rs.each do
                            column_count = 0
                            hash = {} of String => String
                            while column_count != rs.column_count
                                hash["#{rs.column_name(column_count)}"] = "#{rs.read}"
                                column_count += 1
                            end
                            ret_val << hash
                        end
                    end

                    return ret_val
                end
            end
        end
    end
end