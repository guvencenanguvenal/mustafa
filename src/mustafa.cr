require "./mustafa/*"
require "./mustafa/core/*"
require "./mustafa/config/*"
require "./mustafa/library/*"
require "./mustafa/core/helper/*"
require "./mustafa/core/http/*"
require "./mustafa/core/input/*"
#require "./mustafa/base/controller/*"
#require "./mustafa/base/model/*"
#require "./mustafa/base/view/*"
require "./mustafa/base/control/*"

include Mustafa

module Mustafa

  def self.run(port = 8080)
    Core.app.serve port
  end

end
