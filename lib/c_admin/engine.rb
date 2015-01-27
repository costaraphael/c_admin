require 'c_admin/utils'
require 'c_admin/action'
require 'c_admin/scope'
require 'c_admin/model'
require 'c_admin/config'

module CAdmin
  class Engine < ::Rails::Engine
    isolate_namespace CAdmin
  end
end