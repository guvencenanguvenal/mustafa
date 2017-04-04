module Mustafa
  module Core
    module Helper
      class Library
        INSTANCE = Library.new

        property __libraries_class
        property __libraries_obj

        def initialize
          @__libraries_obj = {} of Mustafa::Core::Library.class => Mustafa::Core::Library
          @__libraries_class = {} of Mustafa::Core::Library.class => Mustafa::Core::Library.class
          @__libraries_scope = {} of Mustafa::Core::Library.class => Mustafa::Core::Library::Scope
        end
        
        ###
        # Library register and load methods
        # 
        # this method use polymorphysm
        ###
        def register_library (library_class : Mustafa::Core::Library.class, scope : Mustafa::Core::Library::Scope)
          @__libraries_class[library_class] = library_class
          @__libraries_scope[library_class] = scope
          puts "Library is registed : #{library_class}"
        end

        def load_library(library_class : Mustafa::Core::Library.class)
          if @__libraries_scope[library_class].value == Mustafa::Core::Library::Scope::Singleton.value
            @__libraries_obj[library_class]
          elsif @__libraries_scope[library_class].value == Mustafa::Core::Library::Scope::Request.value
            @__libraries_class[library_class].new
          end
        end

        def get_library_scope(name : Mustafa::Core::Library.class) : Mustafa::Core::Library::Scope
          @__libraries_scope[name]
        end
      end

      def self.library
        yield Library::INSTANCE
      end

      def self.library
        Library::INSTANCE
      end
    end
  end
end
