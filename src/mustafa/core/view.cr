require "ecr"
require "ecr/macros"

module Mustafa
    module Core
        class View
            INSTANCE = View.new

            ###
            # This macro is for initialize ECR View class
            #
            # init "Welcomeview.ecr", param1, param2 ...
            ###
            macro init(filename, *variables)
                def initialize ({% for variable, index in variables %} @{{variable}} : String, {% end %})

                end

                ECR.def_to_s "./#{Mustafa::Config::VIEW_PATH.id}/#{{{filename}}}"
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

                ECR.def_to_s "./#{Mustafa::Config::VIEW_PATH.id}/#{{{filename}}}"
            end

            ###
            # this Mustafa UserControl class powered by Bootstrap!
            # 
            # support basic implementation for bootstrap
            ###
            class Mustafa
                def self.panel(panel_type = "primary", title = "Title", content = "Content")
                    "<div class=\"panel panel-#{panel_type}\"><div class=\"panel-heading\">#{title}</div><div class=\"panel-body\">#{content}</div></div>"
                end

                def self.alert(alert_type = "primary", text = "Alert!")
                    "<div class=\"alert alert-#{alert_type}\" role=\"alert\">#{text}</div>"
                end

                def self.badge(text = "Text", badge_text="1", lbl_type = "primary")
                    "<button class=\"btn btn-#{lbl_type}\" type=\"button\">#{text} <span class=\"badge\">#{badge_text}</span></button>"
                end

                def self.button(value = "Text", enabled = "true")
                    "<button type=\"button\" class=\"btn btn-default\">#{value}</button>"
                end

                def self.form_open(action = "/", method = "GET")
                    "<form action=\"#{action}\" method=\"#{method}\" >"
                end

                def form_input(input_type = "input", id = "mustafa_input", label_text = "Label", placeholder = "Placeholder")
                    "<div class=\"form-group\"><label for=\"#{id}\">#{label_text}</label><input type=\"#{input_type}\" class=\"form-control\" id=\"#{id}\" placeholder=\"#{placeholder}\"></div>"
                end

                def form_button(text = "Submit")
                    "<button type=\"submit\" class=\"btn btn-primary\">#{text}</button>"
                end

                def self.form_close
                    "</form>"
                end
            end

        end

        def self.view
            yield View::INSTANCE
        end

        def self.view
            View::INSTANCE
        end
    end
end
