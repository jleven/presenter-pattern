require 'test_helper'

class OnlyDataInViewTest < ActionController::TestCase
  tests FoosController

  def setup
    super
    @name = "Hello World!"
    @foo = Foo.create :name => @name
  end

  def test_data_variable_in_view
    get :show, :id => @foo.id
    assert_response :success
    assert_equal @name, @response.body
  end

  def test_only_data_variable_in_view
    get :edit, :id => @foo.id
    assert_equal "", @response.body
  end

end
