require 'c_admin/model'

module CAdmin

  mattr_accessor :config

  class Config
    class << self
      def setup(&block)
        @config = Config.new
        block.call @config
        CAdmin.config = @config
        p CAdmin.config
      end
    end

    attr_reader :models

    def initialize
      @models = CAdmin::Model::ModelCollection.new;
    end

    def models=(models)
      models = CAdmin::Model::ModelCollection.new models unless models.is_a? CAdmin::Model::ModelCollection
      @models = models
    end

    def register(model, &block)
      @models.add model, &block
    end
  end
end