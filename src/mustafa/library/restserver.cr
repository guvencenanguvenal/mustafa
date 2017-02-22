require "http/client"
require "json"

module Mustafa
    module Library
        class RESTServer
            INSTANCE = Session.new

            def get(url : String) : JSON
                HTTP::Client.get(url) do |response|
                    if response.status.code == 200

                    
                    end
                end
            end

            def get(url : String, params : Hash(String, String)) : JSON

            end

            def post(url : String) : JSON

            end

            def post(url : String, params : Hash(String, String)) : JSON

            end

            def put(url : String) : JSON

            end

            def put(url : String, params : Hash(String, String)) : JSON

            end

            def delete(url : String) : JSON

            end

            def delete(url : String, params : Hash(String, String)) : JSON

            end

        end

        def self.rest_server
            yield REST::INSTANCE
        end

        def self.rest_server
            REST::INSTANCE
        end
    end
end