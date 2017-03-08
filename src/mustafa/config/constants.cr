module Mustafa
  module Constant
    DB_CONNECTION_STRING = "mysql://root@localhost/mustafa"
    DB_CLASS = Mustafa::Library::Database::Mysql

    SESSION_KEY = "session_cr"
    SESSION_SECRET_KEY = "Mustafa"
  end
end
