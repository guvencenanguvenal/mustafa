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
            def entity_model(table : String, model_class : Core::Model.class)
                _model = model_class.new
                _model.entity_intialize(table)
                yield _model
            end

            ###
            #
            ###
            def entity_model(table : String, model_class : Core::Model.class) : Core::Model
                _model = model_class.new
                _model.entity_intialize(table)
                _model                
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
            def view(controller : Core::Controller, view_class : Core::View.class)
                _view = view_class.new
                _view.load
                yield _view
                controller.out.output = _view.to_s
            end

            ###
            #
            ###
            def view(controller : Core::Controller, view_class : Core::View.class)
                _view = view_class.new
                _view.load
                controller.out.output = _view.to_s
            end

            ###
            #
            ###
            def json(controller : Core::Controller, out_json : String)
                yield
                controller.out.json(out_json)
            end  

            ###
            #
            ###
            def json(controller : Core::Controller, out_json : String)
                controller.out.json(out_json)
            end            

            ###
            #
            ###
            #def control(control_class : Core::Control.class)
            #    yield control_class.new
            #end

            ###
            #
            ###
            #def control(control_class : Core::Control.class) : Core::Control
            #    control_class.new
            #end

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

            @connetion_string = Constant::DB_CONNECTION_STRING
            @db_class = Constant::DB_CLASS
            ###
            #
            ###
            def db : Core::IDatabase
                _db = @db_class.new(@connetion_string)

                return _db
                rescue DB::ConnectionRefused
                    Library.log.add("Database is not conneting : DB Type : #{@db_class}", LogType::System.value)
            end

            ###
            #
            ###
            def db
                _db = @db_class.new(@connetion_string)
                yield _db
                _db.close
                
                rescue DB::ConnectionRefused
                    Library.log.add("Database is not conneting : DB Type : #{@db_class}", LogType::System.value)
            end

            ###
            #
            ###
            def db(db_class : Core::IDatabase.class, connetion_string : String) : Core::IDatabase
                @db_class = db_class
                @connetion_string = connetion_string

                _db = db_class.new(connetion_string)

                return _db
                rescue DB::ConnectionRefused
                    Library.log.add("Database is not conneting : DB Type : #{db_class}", LogType::System.value)
            end

            ###
            #
            ###
            def db(db_class : Core::IDatabase.class, connetion_string : String)
                @db_class = db_class
                @connetion_string = connetion_string

                _db = db_class.new(connetion_string)
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
