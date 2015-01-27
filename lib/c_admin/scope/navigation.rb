module CAdmin::Scope
  class Navigation < Base
    include CAdmin::Utils::HasVisibility

    class << self
      attr_reader :navigation_scopes

      def register_navigation(navigation_scope)
        @navigation_scopes ||= []
        @navigation_scopes << navigation_scope
      end

      def build_navigation
        @navigation_scopes
            .select { |nav| nav.visible? }
            .sort_by { |nav| nav.order }
            .map { |nav| {display_name: nav.display_name, group: nav.group, identifier: nav.identifier} }
            .group_by { |nav| nav[:group] }
      end
    end

    on_init do |model_definition|
      model_name = model_definition.name
      @display_name = model_name.demodulize.titleize.pluralize
      @group = (module_name = model_name.deconstantize).blank? ? nil : module_name.titleize
      @order = 0
      @identifier = model_name.underscore.pluralize.gsub '/', '-'
      self.class.register_navigation self
    end

    def display_name(name = nil)
      return @display_name if name.nil?
      @display_name = name
    end

    def group(name = nil)
      return @group if name.nil?
      @group = name
    end

    def order(order = nil)
      return @order if order.nil?
      @order = order
    end

    def identifier(identifier = nil)
      return @identifier if identifier.nil?
      @identifier = identifier
    end
  end
end