module CAdmin
  class Config
    class << self
      def setup(&block)
        @config = Config.new
        @config.instance_eval &block
        CAdmin.config = @config
        p Model::Scope.navigation_scope.build_navigation
      end

      def navigation
        Model::Scope.navigation_scope.build_navigation
      end
    end

    attr_reader :models

    def initialize
      @models = Model::ModelCollection.new;
    end

    def register_model(model, &block)
      @models.add model, &block
    end

    def register_models(*models, &block)
      models.each { |model| register_model model, &block }
    end

    def navigation_scope(scope)
      Model::Scope.navigation_scope = scope
    end
  end
end