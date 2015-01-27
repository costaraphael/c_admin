module CAdmin::Model
  class ModelCollection
    extend Enumerable

    def initialize(collection = [])
      @collection = {}
      collection.each { |model| self << model }
    end

    def each(&block)
      @collection.each_value &block
    end

    def add(model, &block)
      model = model.to_s unless model.is_a? String
      @collection[model] ||= ModelDefinition.new(model)
      @collection[model].configure &block if block_given?
    end

    alias_method :push, :add
    alias_method :<<, :add
  end
end