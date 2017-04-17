require "ecr"
require "ecr/macros"

module Mustafa
    module Core
        abstract class Control

            ###
            # This macro is for initialize ECR Control class
            #
            # init "Welcomecontrol.ecr"
            ###
            macro init(filename, props, script = "")
                {% for name, type in props %}
                property {{name.id}} : {{type.id}}?
                {% end %}

                def load(
                {% for name, type in props %}
                    {{name.id}} : {{type.id}},
                {% end %}
                )
                {% for name, type in props %}
                    @{{name.id}} = {{name.id}}
                {% end %}
                    return self
                end

                def to_s(__io__)
                    ECR.embed "./#{Config::CONTROL_PATH.id}/#{{{filename}}}", "__io__"
                end

                def initialize
                    @script = {{script}}
                end
            end

            ###
            #
            ###
            property script = ""


        end
    end
end
