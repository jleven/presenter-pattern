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

  def test_only_data_variable_in_view
    get :no_vars, :id => @foo.id
    assert_equal "", @response.body
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

  def test_no_explicit_render
    assert_raise(PresenterPattern::API::NoExplicitRender) do
      get :explicit
    end
  end
end
