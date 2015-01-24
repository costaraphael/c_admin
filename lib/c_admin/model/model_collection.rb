module CAdmin::Model
  class ModelCollection
    extend Enumerable

    delegate :each, to: :collection

    def initialize(collection = [])
      @collection = []
      collection.each {|model| self << model}
    end

    def +(array)
      array.each { |item| self << item }
    end

    def add(model, &block)
      model = model.to_s unless model.is_a? String
      @collection << ModelDefinition.new(model, &block)
    end

    alias_method :push, :add
    alias_method :<<, :add

    private
    def collection
      @collection
    end
  end
end