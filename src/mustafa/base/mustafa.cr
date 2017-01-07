module Mustafa
  class Notfoundcontroller < Controller
    register Notfoundcontroller

    action "index" do
      load_ecr Notfoundview, "Welcomecontroller"
    end

  end
end
