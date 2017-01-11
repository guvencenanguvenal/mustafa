module Mustafa
  class Notfoundcontroller < Core::Controller
    init Notfoundcontroller

    action "index" do
      load_ecr Notfoundview, "Welcomecontroller"
    end

  end
end
