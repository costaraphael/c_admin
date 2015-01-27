module CAdmin
  class RootController < ApplicationController
    action_type :root

    def index
      response = action.send(request.method_symbol, params)
      @data = response.data
      render response.view
    end
  end
end
