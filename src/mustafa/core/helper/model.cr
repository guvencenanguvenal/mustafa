module Mustafa
  module Core
    module Helper
      class Model
        INSTANCE = Model.new

        property :__models_obj
        property :__models

        def initialize
          @__models_obj = {} of Mustafa::Core::Model.class => Mustafa::Core::Model
          @__models = {} of Mustafa::Core::Model.class => Mustafa::Core::Model.class
          @__models_scope = {} of Mustafa::Core::Model.class => Mustafa::Core::Model::Scope
        end

        ###
        # Controller register and load methods
        # 
        # this method use polymorphysm
        ###
        def register_model (model_class : Mustafa::Core::Model.class, scope : Mustafa::Core::Model::Scope)
          @__models[model_class] = model_class
          @__models_scope[model_class] = scope
          puts "Model is registed : #{model_class}"
        end

        def load_model (name : Mustafa::Core::Model.class)
          if @__models_scope[name].value == Mustafa::Core::Model::Scope::Singleton.value
            @__models_obj[name]
          elsif @__models_scope[name].value == Mustafa::Core::Model::Scope::Request.value
            @__models[name].new
          elsif @__models_scope[name].value == Mustafa::Core::Model::Scope::Prototype.value
            @__models_obj[name]#.clone
          end
        end

        def get_model_scope(name : Mustafa::Core::Model.class) : Mustafa::Core::Model::Scope
          @__models_scope[name]
        end
      end

      def self.model
        yield Model::INSTANCE
      end

      def self.model
        Model::INSTANCE
      end
    end
  end
end
