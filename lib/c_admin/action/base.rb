module CAdmin::Action
  class Base
    class << self
      def method_missing(method, *args)
        nil
      end

      def identifier
        self.to_s.demodulize.underscore.to_sym
      end
    end
  end

  ResponseData = Struct.new(:view, :data)
end