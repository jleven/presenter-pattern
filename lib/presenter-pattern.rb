require 'presenter-pattern/railtie'
require 'json-builder/railtie'

module PresenterPattern
  def protected_instance_variables
    return instance_variable_names - ["@data"] if respond_to?(:instance_variable_names)
    super
  end
end


