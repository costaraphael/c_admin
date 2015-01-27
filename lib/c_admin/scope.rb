module CAdmin::Scope
  class << self
    def navigation_scope=(scope)
      @navigation_scope = scope_for scope
    end

    def navigation_scope
      @navigation_scope ||= Navigation
    end

    def register_scope(scope)
      @scopes ||= []
      @scopes << scope
    end

    def each_scope(&block)
      @scopes.each &block
    end

    def scope_for(scope)
      scope = @scopes.select { |_scope| _scope.identifier == scope }.first
      raise "The scope #{scope} was not found." if scope.nil?
      scope
    end
  end
end
require 'c_admin/scope/base'
require 'c_admin/scope/fields'
require 'c_admin/scope/list'
require 'c_admin/scope/form'
require 'c_admin/scope/show'
require 'c_admin/scope/navigation'