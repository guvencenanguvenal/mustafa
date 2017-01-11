module Mustafa
  module Helper
    class Encoder
      class BadData < Exception
      end

      def initialize(@secret : String)
      end

      def encode(data : String)
        Base64.encode(data) + "--" + generate_signature(data)
      end

      def decode(data : String)
        data, signature = data.split("--")
        Base64.decode_string(data).tap do |data|
          raise BadData.new("Signature does not match") unless generate_signature(data) == signature
        end
      end

      private def generate_signature(data)
        OpenSSL::HMAC.hexdigest(:sha1, @secret, data)
      end

      def hex_digest(data)
        Crypto::MD5.hex_digest(data)
      end
    end
  end
end
