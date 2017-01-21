require "ecr"
require "ecr/macros"

module Mustafa
  class Notfoundview < Core::View
    def initialize

    end

    ECR.def_to_s "./lib/mustafa/base/Notfoundview.ecr"
  end
end
