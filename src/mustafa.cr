require "./mustafa/*"
require "./mustafa/core/*"
require "./mustafa/input/*"
require "./mustafa/config/*"
require "./mustafa/library/*"
require "./mustafa/library/db/*"
require "./mustafa/core/helper/*"
require "./mustafa/core/http/*"
require "./mustafa/classextension/*"
require "./mustafa/base/**"
require "db"
require "mysql"
require "sqlite3"

include Mustafa

module Mustafa

  def self.run(port = 8080)
    Core.app.serve port
  end

end
