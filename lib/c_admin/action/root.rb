module CAdmin::Action
  class Root < Base
    class << self
      def inherited(action)
        CAdmin::Action.register_action(action, :root)
      end

      def translation_str
        "c_admin.actions.root.#{identifier}"
      end
    end
  end
end