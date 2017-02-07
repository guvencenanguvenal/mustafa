module Mustafa
    module Core
        class Loader

            INSTANCE = Loader.new

            def initialize
                @custom_libraries = {} of String => Core::Library
            end

            ###
            #
            ###
            def model(model_class : Core::Model.class)
                yield model_class.new
            end

            ###
            #
            ###
            def model(model_class : Core::Model.class) : Core::Model
                model_class.new
            end

            ###
            #
            ###
            def view(view_class : Core::View.class)
                _view = view_class.new
                _view.load
                yield _view
            end

            ###
            #
            ###
            def view(view_class : Core::View.class) : Core::View
                _view = view_class.new
                _view.load
                _view
            end

            ###
            #
            ###
            def control(control_class : Core::Control.class)
                yield control_class.new
            end

            ###
            #
            ###
            def control(control_class : Core::Control.class) : Core::Control
                control_class.new
            end

            ###
            #
            ###
            def custom_library(library_class : Core::Library.class)
                _tmp_array = "#{library_class}".split("::")
                library_name = _tmp_array.max

                if !@custom_libraries.has_key?(library_name)
                    @custom_libraries[library_name] = library_class.new
                    yield @custom_libraries[library_name]
                else
                    yield @custom_libraries[library_name]
                end                
            end

            ###
            #
            ###
            def custom_library(library_class : Core::Library.class) : Core::Library
                _tmp_array = "#{library_class}".split("::")
                library_name = _tmp_array.max

                if !@custom_libraries.has_key?(library_name)
                    @custom_libraries[library_name] = library_class.new

                    @custom_libraries[library_name]
                else
                    @custom_libraries[library_name]
                end                
            end

            ###
            #
            ###
            def db(db_class : Core::DB.class, connetion_string : String) : Core::DB
                _db = db_class.new
                _db.open(connetion_string)

                return _db
                rescue DB::ConnectionRefused
                    Library.log.add("Database is not conneting : DB Type : #{db_class}", LogType::System.value)
            end

            ###
            #
            ###
            def db(db_class : Core::DB.class, connetion_string : String)
                _db = db_class.new
                _db.open(connetion_string)
                yield _db
                _db.close
                
                rescue DB::ConnectionRefused
                    Library.log.add("Database is not conneting : DB Type : #{db_class}", LogType::System.value)
            end
        end

        def self.loader
            Loader::INSTANCE
        end

        def self.loader
            yield Loader::INSTANCE
        end
    end
end
