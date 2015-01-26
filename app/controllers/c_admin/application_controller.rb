module CAdmin
  class ApplicationController < ActionController::Base
    private
    def action
      @action ||= CAdmin.config. if params[:action]
    end
  end
end
