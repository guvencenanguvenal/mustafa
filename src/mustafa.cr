require "./mustafa/*"
require "./mustafa/core/*"
require "./mustafa/config/*"
require "./mustafa/core/helper/*"
require "./mustafa/core/http/*"
require "./mustafa/core/input/*"

include Mustafa

module Mustafa

  def self.run(port = 8080)
    Core.app.serve port
  end

end
