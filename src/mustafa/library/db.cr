require "db"

module Mustafa
    module Library
        class Database
            
            INSTANCE = Database.new

            enum DBType
                SQLlite
                MySQL
                PostgreSQL
            end

            @@db_type
            getter db : Database

            def initialize(db_type : DBType)
                @@db_type = db_type
                @db = DB.open "sqlite3:./file.db"
            end

            def exec(q_str : String)
                args = [] of DB::Any
                args << "Sarah"
                args << 33
                db.exec "insert into contacts values (?, ?)", args
            end

            def query(q_str : String)
                @db.query q_str do |rs|
                    rs.each do
                        puts "#{rs.read(String)} (#{rs.read(Int32)})"
                        # => Sarah (33)
                        # => John Doe (30)
                    end
                end
            end

            def select_all(table : String, where : String)
                db.query "select * from contacts order by age desc" do |rs|
                    puts "#{rs.column_name(0)} (#{rs.column_name(1)})"
                    # => name (age)
                    rs.each do
                    puts "#{rs.read(String)} (#{rs.read(Int32)})"
                    # => Sarah (33)
                    # => John Doe (30)
                    end
                end
            end

            def select_count(table : String, where : String)
                
            end

            def close
                @db.close
            end
        end

        def self.db
            yield Database::INSTANCE
        end

        def self.db
            Database::INSTANCE
        end
    end
end