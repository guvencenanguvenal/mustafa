module Mustafa
  class JSONview < Core::View
    
    def initialize(output : String)
      @out = output
    end

    def load
      @content_type = "application/json"
      @content_length = @out.size
    end

    def to_s
      @out
    end
  end
end
