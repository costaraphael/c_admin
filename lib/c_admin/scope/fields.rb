module CAdmin::Scope
  module Fields
    def field(name, type = nil, &block)
      @fields ||= {}
      @fields[name.to_sym] = CAdmin::Model::FieldDefinition.new name, type, &block
    end
  end
end