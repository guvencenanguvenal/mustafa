require "http"
require "json"

module Mustafa
    module Http
        module Session
            class Handler < HTTP::Handler
                def initialize(@session_key = "session_cr", secret_key = "Mustafa")
                    @encoder = Helper::Encoder.new(secret_key)
                end

                def call(context)
                    context.session = get_session(context.request.cookies)
                    
                    if next_handler = @next
                        next_handler.call(context)
                    end
                    set_session(context.response, @encoder.hex_digest(context.session.to_json))
                end

                private def get_session(cookies) : Hash(String, String)
                    if cookie = cookies[@session_key]?
                        Hash(String, String).from_json(@encoder.decode(cookie.value))
                    else
                        Hash(String, String).new
                    end
                end

                private def set_session(response, data)
                    response.set_cookie(@session_key, data)
                end

                private def delete_session
                    response.delete_cookie(@session_key)
                end
            end
        end
    end
end

class HTTP::Server::Context
  property! session : Hash(String, String)
end