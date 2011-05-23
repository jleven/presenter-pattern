require 'test_helper'

class NoQueryingViewTest < ActionController::TestCase
  tests FoosController

  def setup
    super
    #Foo.delete_all

#    @controller = FoosController.new
#    @request    = ActionController::TestRequest.new
#    @response   = ActionController::TestResponse.new

#    PresenterPattern::Application.routes.draw do
#      resource :foo
#    end

    @foo = Foo.create :name => "name"
  end

#  def teardown
#    super
#    Foo.delete_all
#  end

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
