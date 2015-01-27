module CAdmin::Action
  class Dashboard < Root
    class << self
      def get(params)
        ResponseData.new 'c_admin/action/dashboard'
      end
    end
  end
end