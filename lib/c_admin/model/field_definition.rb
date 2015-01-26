module CAdmin::Model
  class FieldDefinition
    attr_reader :name, :type

    def initialize(name, type = nil, &block)
      @name = name
      @type = type_definition_for(type).new unless type.nil?

      @visible = true

      instance_eval &block if block_given?
    end

    def method_missing(method, *args, &block)
      @type.send method, *args, &block
    end

    private
    def type_definition_for(type)
      type
    end
  end
end