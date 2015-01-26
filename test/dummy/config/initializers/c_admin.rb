CAdmin::Config.setup do |config|
  # You can quickly define which models will be managed by CAdmin
  config.register_models 'MyModel', 'MyModule::MyOtherModel', Endereco

  # register_model 'Endereco' do
  #   navigation do
  #     display_name 'Endereços'
  #     order 10
  #   end
  # end
  #
  # register_model 'MyModule::MyModel' do
  #   configure do
  #     visibility true
  #   end
  #
  #   navigation do
  #     group 'My Group'
  #     order 15
  #   end
  # end
end