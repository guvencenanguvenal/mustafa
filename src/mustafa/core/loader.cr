module Mustafa
    module Core
        class Loader

            INSTANCE = Loader.new

            def initialize
                
            end

            ###
            # load model and return
            ###
            def model(model_name : Model.class)
                _model = Helper.model.load_model model_name
                if _model
                    return _model
                else
                    Mustafa::Library.log.add("Model is not found! #{model_name}", Mustafa::LogType::Application.value)
                    raise "Model is not found!"
                end
            end

            ###
            # load model with block
            ###
            def model(model_name : Model.class)
                _model = Helper.model.load_model model_name

                if _model
                    yield _model
                else
                    Mustafa::Library.log.add("Model is not found! #{model_name}", Mustafa::LogType::Application.value)
                    raise "Model is not found!"
                end
            end

            ###
            # load view and return
            ###
            def view(controller_class : Core::Controller.class, view_class : Core::View.class)
                Helper.controller.__controllers[Helper.controller.__controller_names[controller_class]].register_view view_class
            end

            ###
            # load view with block
            ###
            def view(controller_class : Core::Controller.class, view_class : Core::View.class)
                Helper.controller.__controllers[Helper.controller.__controller_names[controller_class]].register_view view_class do |view|
                    yield view
                end
            end  

            ###
            # load json view 
            ###
            def json(controller_class : Core::Controller.class, json_output : String)
                Helper.controller.__controllers[Helper.controller.__controller_names[controller_class]].register_json json_output
            end    

            ###
            # load single library and return
            ###
            def library(library_name : Core::Library.class)
                _lib = Helper.library.load_library(library_name)
                if _lib
                    return _lib
                else
                    Mustafa::Library.log.add("Model is not found! #{library_name}", Mustafa::LogType::Application.value)
                    raise "Library is not found!"
                end
            end

            ###
            # load single library with block
            ###
            def library(library_name : Core::Library.class)
                _lib = Helper.library.load_library(library_name)
                if _lib
                    yield _lib
                else
                    Mustafa::Library.log.add("Model is not found! #{library_name}", Mustafa::LogType::Application.value)
                    raise "Library is not found!"
                end
            end       

            ###
            # load multiple libraries and return with hash 
            ###
            def library(library_names : Array(Core::Library.class))
                _libraries = Hash(Core::Library.class, Core::Library).new

                library_names.each do |name|
                    _lib = Helper.library.load_library(name)
                    
                    if _lib
                        _libraries[name] = _lib
                    end
                end
                
                yield _libraries
            end

            ###
            # load multiple libraries with block and return with hash 
            ###
            def library(library_names : Array(Core::Library.class)) : Hash(Core::Library.class, Core::Library)
                _libraries = Hash(Core::Library.class, Core::Library).new

                library_names.each do |name|
                    _lib = Helper.library.load_library(name)
                    
                    if _lib
                        _libraries[name] = _lib
                    end
                end
                
                _libraries           
            end

            @__connetion_string = Constant::DB_CONNECTION_STRING
            @__db_class = Constant::DB_CLASS
            ###
            #
            ###
            def db : Core::IDatabase
                _db = @__db_class.new(@connetion_string)

                return _db
                rescue DB::ConnectionRefused
                    Mustafa::Library.log.add("Database is not conneting : DB Type : #{@__db_class}", Mustafa::LogType::System.value)
            end

            ###
            #
            ###
            def db
                _db = @__db_class.new(@__connetion_string)
                yield _db
                _db.close
                
                rescue DB::ConnectionRefused
                    Mustafa::Library.log.add("Database is not conneting : DB Type : #{@__db_class}", Mustafa::LogType::System.value)
            end

            ###
            #
            ###
            def db(db_class : Core::IDatabase.class, connetion_string : String) : Core::IDatabase
                @__db_class = db_class
                @__connetion_string = connetion_string

                _db = db_class.new(connetion_string)

                return _db
                rescue DB::ConnectionRefused
                    Mustafa::Library.log.add("Database is not conneting : DB Type : #{db_class}", Mustafa::LogType::System.value)
            end

            ###
            #
            ###
            def db(db_class : Core::IDatabase.class, connetion_string : String)
                @__db_class = db_class
                @__connetion_string = connetion_string

                __db = db_class.new(connetion_string)
                yield _db
                _db.close
                
                rescue DB::ConnectionRefused
                    Mustafa::Library.log.add("Database is not conneting : DB Type : #{db_class}", Mustafa::LogType::System.value)
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
