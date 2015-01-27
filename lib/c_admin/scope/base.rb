module CAdmin::Scope
  class Base
    class << self

      def inherited(scope)
        CAdmin::Scope.register_scope scope
      end

      def identifier
        self.to_s.demodulize.underscore.to_sym
      end

      def on_init(&block)
        @on_init ||= []
        @on_init << block if block_given?
        @on_init
      end
    end

    def initialize(model_definition)
      @model_definition = model_definition
      self.class.on_init.each { |initializer| self.instance_exec model_definition, &initializer }
    end

    def method_missing(method, *args)
    end
  end
end