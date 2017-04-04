module Mustafa
    module Input
        class PARAMS
            INSTANCE = PARAMS.new

            getter :params

            def initialize
                @params = [] of String
            end

            ###
            # this method return only a get query parameter 
            # 
            ###
            def [](index : Int32) : String
                if @params.size > index
                    @params[index]
                else
                    ""
                end
            end

            ###
            # this method is implement for develop envoriment
            ###
            def set_params(params_array : Array(String))
                @params = params_array
            end
        end

        def self.params
            yield PARAMS::INSTANCE
        end

        def self.params
            PARAMS::INSTANCE
        end

    end
end