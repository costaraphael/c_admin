module CAdmin::Model::Scope
  class << self
    attr_reader :scopes

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

    def scope_for(scope)
      scope_name = "CAdmin::Model::Scope::#{scope.to_s.camelize}"
      begin
        scope_name.constantize
      rescue NameError
        raise "The scope #{scope_name} was not found."
      end
    end
  end
end
require 'c_admin/model/scope/base'
require 'c_admin/model/scope/fields'
require 'c_admin/model/scope/list'
require 'c_admin/model/scope/form'
require 'c_admin/model/scope/show'
require 'c_admin/model/scope/navigation'