module CAdmin::Utils
  module HasVisibility

    def self.included(klass)
      klass.instance_eval do
        on_init do
          @visible = true
        end
      end
    end

    def visibility(visible = nil, &block)
      @visible = visible
      @visible = block if block_given?
    end

    def visible?
      return OpenStruct.new(instance: @model_definition).instance_eval &@visible if @visible.respond_to? :call
      @visible
    end
  end
end