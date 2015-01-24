module CAdmin::Model
  class ModelDefinition
    attr_reader :name, :configs

    def initialize(name, &block)
      @name = name
      @config = {}
      # TODO parse configs from block
    end

    def model
      @name.constantize
    end

    def field(name, type = nil)

    end
  end
end