require "./mustafa/*"
require "./mustafa/core/*"
require "./mustafa/config/*"
require "./mustafa/core/helper/*"
require "./mustafa/core/http/*"

include Mustafa

module Mustafa

  def self.run
    Core.app.serve
  end

end
