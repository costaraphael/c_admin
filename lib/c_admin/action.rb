module CAdmin::Action
  class << self
    def register_action(action, type)
      action_store(type) << action
    end

    def register_default_action(action, type)
      default_action_store[type] = action
    end

    def each_action(type, &block)
      action_store(type).each &block
    end

    def default_action_for(type)
      default_action_store[type]
    end

    def action_for(type, action)
      action = action_store(type).select { |_action| _action.identifier == action }.first
      raise "The action #{action} was not found." if action.nil?
      action
    end

    private
    def action_store(type)
      @actions ||= {}
      @actions[type.to_sym] ||= []
    end

    def default_action_store
      @default_actions ||= {root: Dashboard}
    end
  end
end

require 'c_admin/action/base'
require 'c_admin/action/root'
require 'c_admin/action/dashboard'
