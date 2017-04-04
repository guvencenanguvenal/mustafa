module Mustafa
  class Notfoundcontroller < Core::Controller
    init Notfoundcontroller

    action "index" do
      Core.loader.view(self, Notfoundview)
    end

  end
end
