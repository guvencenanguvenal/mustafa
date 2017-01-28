require "ecr"
require "ecr/macros"

module Mustafa
    module Core
        abstract class View
            
            ###
            # this method is abstract. it use for initialize view s values
            #
            ###
            abstract def load

            ###
            # This macro is for initialize ECR View class
            #
            # init "Welcomeview.ecr", param1, param2 ...
            ###
            macro init(filename, *variables)
                def initialize ({% for variable, index in variables %} @{{variable}} : String, {% end %})

                end

                ECR.def_to_s "./#{Config::VIEW_PATH.id}/#{{{filename}}}"
            end

            ###
            # this macro create base view class
            #
            ###
            macro init_base_view(name, filename)
                class {{name}} < Core::View
                    def load 
                    end

                    ECR.def_to_s {{filename}}
                end
            end

            ###
            # this macro is for initialize ECR View class with bootstrap template
            #
            # init "Welcomeview.ecr", param1, param2 ...
            ###
            macro init_bootstrap(filename, *variables)
                def initialize ({% for variable, index in variables %} @{{variable}} : String, {% end %} 
                            @bs_install = "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">",
                            @bs_install_js = "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>")
                end

                ECR.def_to_s "./#{Config::VIEW_PATH.id}/#{{{filename}}}"
            end

            ###
            # this macro load component for view
            #
            #
            ###
            macro load_custom_control(control_name)
                property {{control_name.downcase.id}} = {{control_name.id}}.new
            end
        end
    end
end
