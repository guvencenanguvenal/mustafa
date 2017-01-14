require "smtp"

module Mustafa
    module Library
        class Mail
            INSTANCE = Mail.new

            getter host : String

            ###
            # this class is singletone
            # initialize with host and use this host for all connect
            #
            # Library.mail.host = "localhost"  --set only once or use default value (localhost)
            # 
            # Library.mail.send("mustafa@mustafavc.com", "mustafa", "kemal@mustafavc.com", "kemal", "merhaba", "selam")
            ###

            def initialize()
                @host = "localhost"
            end

            def send(from : String, from_name : String, to : String, to_name : String, subject : String, body : String)
                client = SMTP::Client.new(@host)

                message = SMTP::Message.new()

                message.from = SMTP::Address.new(email = from, name = from_name)
                message.to << SMTP::Address.new(email = to, name = to_name)
                message.subject = subject
                message.body = body

                client.send message
            end

        end

        def self.mail
            yield Mail::INSTANCE
        end

        def self.mail
            Mail::INSTANCE
        end
    end
end