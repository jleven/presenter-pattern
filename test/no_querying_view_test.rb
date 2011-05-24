require 'test_helper'

class NoQueryingViewTest < ActionController::TestCase
  tests FoosController

  def setup
    super
    @foo = Foo.create :name => "name"
  end

  def test_thin_views_are_successful
    get :show, :id => @foo.id
    assert_response :success
  end

  def test_thick_views_fail
    assert_raise(ActionView::Template::Error) do
      get :index
    end
  end

end
