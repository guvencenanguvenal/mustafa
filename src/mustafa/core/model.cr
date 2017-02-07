module Mustafa
  module Core
    abstract class Model < Core::DB

      getter entity_name = ""

      macro init(table_name)
        initialize_entity({{table_name}})
      end

      def initialize_entity(table : String)
        @entity_name = table
      end

      def open(connetion_string : String)

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

      #this class for model
    end
  end
end
