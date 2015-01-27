module CAdmin::Model
  class ModelDefinition
    attr_reader :name

    def initialize(name)
      @name = name
      @config = {}
      CAdmin::Scope.each_scope do |scope|
        @config[scope.identifier] ||= scope.new self
      end
    end

    def model
      @name.constantize
    end

    def configure(&block)
      @config = ModelConfigurator.parse @config, &block
    end

    def scope(scope)
      @config[scope.to_sym]
    end
  end
end