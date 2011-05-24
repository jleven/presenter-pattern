require 'test_helper'

class JsonResponderTest < ActionController::TestCase
  tests BarsController

  def setup
    super
    @name = "Hello World!"
    @bar = Bar.create :name => @name
  end

  def test_data_variable_in_view
    get :show, :id => @bar.id, :format => 'json'
    assert_response :success
    assert_equal '{"name":"Hello World!","fruit":"banana"}', @response.body
  end
end
