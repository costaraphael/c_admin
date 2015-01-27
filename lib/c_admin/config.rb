module CAdmin
  class Config
    class << self
      def setup(&block)
        @config = Config.new
        @config.instance_eval &block
        CAdmin.config = @config
      end

      def navigation
        Scope.navigation_scope.build_navigation
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
      Scope.navigation_scope = scope.to_sym
    end

    def default_root_action(action)
      Action.register_default_action(action.to_sym, :root)
    end
  end
end