require "./mustafa/*"
require "./mustafa/core/*"
require "./mustafa/config/*"
require "./mustafa/core/helper/*"
require "./mustafa/core/http/*"

module Mustafa
  # TODO Put your code here

  def self.run
    Core.app.serve
  end

end
