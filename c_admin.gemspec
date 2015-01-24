$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'c_admin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'c_admin'
  s.version     = CAdmin::VERSION
  s.authors     = ['Raphael Vidal']
  s.email       = ['raphael@bitbucket.org']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of CAdmin.'
  s.description = 'TODO: Description of CAdmin.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.0'

  s.add_development_dependency 'sqlite3'
end
