require "http"
require "json"

module Mustafa
    module Http
        module Session
            class Handler

                include HTTP::Handler

                def initialize(@session_key = Constant::SESSION_KEY, secret_key = Constant::SESSION_SECRET_KEY)
                    @encoder = Helper::Encoder.new(secret_key)
                end

                def call(context)
                    context.session = get_session(context.request.cookies)
                    data = @encoder.hex_digest(context.session.to_json)
                    if next_handler = @next
                        next_handler.call(context)
                    end
                    set_session(context.response, context.session, data)
                end

                private def get_session(cookies) : Hash(String, String)
                    if cookie = cookies[@session_key]?
                        Hash(String, String).from_json(@encoder.decode(cookie.value))
                    else
                        Hash(String, String).new
                    end
                end

                private def set_session(response, session, data)
                    data = session.to_json
                    return if data == @encoder.hex_digest(data)
                    response.set_cookie(@session_key, @encoder.encode(data))
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