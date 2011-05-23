require 'test_helper'
require 'rails/all'
require 'action_controller/test_case'

require 'presenter-rails'

class NoQueryingViewTest < Test::Unit::TestCase
  load_schema

  def setup
    @controller = MyController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    Rails.application.routes.draw do |map|
      map.resources :foos
    end
  end

  def test_thin_views_are_successful
    foo = Foo.create :name => "name", :squawk => "squawk!"

    get :show, {:id => foo.id}
    assert_response :success
  end

  def test_thick_views_fail
    assert_raise(Presenter::Rails::IllegalDatabaseQueryFromView) do
      get :index
    end
  end

end
