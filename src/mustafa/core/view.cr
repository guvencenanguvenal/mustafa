require "ecr"
require "ecr/macros"

module Mustafa
    module Core
        abstract class View
            
            getter view_params = {} of String => String
            getter view_arrays = {} of String => Array(String)
            getter view_hashes = {} of String => Hash(String, String)
            getter view_controls = {} of String => Core::Control
            getter script = ""
            getter css = ""

            property content_type = "text/html"
            property content_length = 0
            property status_code = 200

            ###
            #
            ###
            def script=(val : String)
                @script = @script + val
            end

            def css=(val : String)
                @css = @css + val
            end

            ###
            # this method is abstract. it use for initialize view s values
            #
            ###
            abstract def load

            ###
            # This method to add param to view
            ###
            def add_param(key : String, value : String)
                @view_params[key] = value
            end

            ###
            # This method to send array to view
            ###
            def add_array_param(key : String, value : Array(String))
                @view_arrays[key] = value
            end

            ###
            # This method to send hash to view
            ###
            def add_hash_param(key : String, value : Hash(String))
                @view_arrays[key] = value
            end

            ###
            #
            ###
            def add_user_control(control_name : String, control_class : Core::Control.class)
                @view_controls[control_name] = control_class.new
                @script = @script + "\n\n" + @view_controls[control_name].script
                yield @view_controls[control_name]
            end

            ###
            #
            ###
            def add_user_control(control_name : String, control_class : Core::Control.class)
                @view_controls[control_name] = control_class.new
                @script = @script + "\n\n" + @view_controls[control_name].script
            end

            ###
            # This macro is for initialize ECR View class
            #
            # init "Welcomeview.ecr"
            ###
            macro init(filename)
                def initialize ()

                end

                ECR.def_to_s "./#{Config::VIEW_PATH.id}/#{{{filename}}}"
            end
        end
    end
end
