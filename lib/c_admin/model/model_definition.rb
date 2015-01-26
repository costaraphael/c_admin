module CAdmin::Model
  class ModelDefinition
    attr_reader :name

    def initialize(name)
      @name = name
      @config = {}
      Scope.scopes.each do |scope|
        @config[scope.attr_name] ||= scope.new self
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