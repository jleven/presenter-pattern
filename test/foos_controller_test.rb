require 'test_helper'

class FoosControllerTest < ActionController::TestCase
  include PresenterPattern::TestCase
  tests FoosController

  def setup
    super
    @name = "Name"
    @foo = Foo.create :name => @name
  end

  def test_index
    get :index
    assert_response :success
    assert_equal @name, @response.body
  end

  def test_show
    get :show, :id => @foo.id
    assert_response :success
    assert_equal @name, @response.body
  end

  def test_new
    get :new
    assert_response :success
    assert_equal "", @response.body
  end

  def test_create_success
    post :create, :foo => @foo.attributes, :format => :json
    assert_response :success
    assert_equal @foo.to_json, @response.body
  end

  def test_create_failure
    post :create, :foo => {}, :format => :json
    assert_response :unprocessable_entity
    assert_equal "{\"name\":[\"can't be blank\"]}", @response.body
  end

  def test_create_failure_ajax
    xhr :post, :create, :foo => {}, :format => :json
    assert_response :unprocessable_entity
    assert_equal "{\"name\":[\"can't be blank\"]}", @response.body
  end

  def test_respond_opts
    get :edit, :id => @foo.id, :format => :json
    assert_response 206
    assert_equal @foo.to_json, @response.body
  end

  def test_destroy
    assert_difference('Foo.count', -1) do
      delete :destroy, :id => @foo.id, :format => :json
    end
    assert_response :success
    assert_equal "{}", @response.body
  end

  def test_assigns_test
    get :new
    assert assigns(:foo)
  end

  def test_assigns_test_plural
    get :index
    assert assigns(:foos)
  end
end
