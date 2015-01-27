module CAdmin
  class ApplicationController < ActionController::Base
    class << self
      def action_type(type = nil)
        return @action_type if type.nil?
        @action_type = type.to_sym
      end
    end

    private
    def action
      return @action ||= CAdmin::Action.action_for(self.class.action_type, params[:_action].to_sym) if params[:_action]
      @action ||= CAdmin::Action.default_action_for(self.class.action_type)
    end
  end
end
