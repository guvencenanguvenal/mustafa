module Mustafa
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

  end

  def self.view
      yield View::INSTANCE
  end

  def self.view
      View::INSTANCE
  end

end
