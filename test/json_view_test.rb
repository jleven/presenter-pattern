require 'test_helper'

class JsonViewTest < ActionController::TestCase
  tests FoosController

  def setup
    super
    @name = "Hello World!"
    @foo = Foo.create :name => @name
  end

  def test_data_variable_in_view
    get :show, :id => @foo.id, :format => 'json'
    assert_response :success
    assert_equal '{"name":"Hello World!","array":["a","c"],"hash":{"value1":1,"value2":["a","b","c"]}}', @response.body
  end
end
