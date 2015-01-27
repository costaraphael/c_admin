module CAdmin::Model
  class ModelConfigurator
    class << self
      def parse(config, &block)
        @config = config
        instance_eval &block
        @config
      end

      private
      def method_missing(method, *args, &block)
        CAdmin::Scope.scope_for method
        @config[method].instance_eval &block
      end

      def configure(&block)
        CAdmin::Scope.each_scope do |scope|
          @config[scope.identifier].instance_eval &block
        end
      end
    end
  end
end