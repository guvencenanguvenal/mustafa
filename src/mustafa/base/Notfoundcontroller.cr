module Mustafa
  class Notfoundcontroller < Core::Controller
    register Notfoundcontroller

    action "index" do
      load_ecr Notfoundview, "Welcomecontroller"
    end

  end
end
