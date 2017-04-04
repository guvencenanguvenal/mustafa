require "ecr"
require "ecr/macros"

module Mustafa
  class Notfoundview < Core::View
    def load

    end

    ECR.def_to_s "./lib/mustafa/src/mustafa/base/view/Notfoundview.ecr"
  end
end
