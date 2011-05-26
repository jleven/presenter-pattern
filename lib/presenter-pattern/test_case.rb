module PresenterPattern
  module TestCase
    def assigns(key = nil)
      name  = @controller.instance_variable_get :@view_var_name
      value = @controller.instance_variable_get :@__rval
      assigns = {}.with_indifferent_access
      assigns[name] = value
      key.nil? ? assigns : assigns[key]
    end
  end
end