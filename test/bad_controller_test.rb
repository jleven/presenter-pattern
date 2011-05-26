require 'test_helper'

class BadControllerTest < ActionController::TestCase
  tests BadController

  def setup
    super
    @name = "Hello World!"
    @foo = Foo.create :name => @name
  end

  def test_data_variable_in_view
    get :good, :id => @foo.id
    assert_response :success
    assert_equal @name, @response.body
  end

  def test_non_data_variable_in_view
    get :vars, :id => @foo.id
    assert_equal "I can see this in the view!", @response.body
  end

  def test_empty_action
    get :empty
    assert_response :success
  end

  def test_query_in_view_fails
    assert_raise(ActionView::Template::Error) do
      get :query
    end
  end

  def test_explicit_render
    get :explicit
    assert_nil assigns(:data) #shouldn't set @data even though there was a return value since render was called explicitly
  end
end
