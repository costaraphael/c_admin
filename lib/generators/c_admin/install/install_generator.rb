require 'rails/generators'

module CAdmin
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      copy_file 'initializer.rb', 'config/initializers/c_admin.rb'
    end
  end
end
