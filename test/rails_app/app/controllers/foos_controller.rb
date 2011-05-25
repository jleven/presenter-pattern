class FoosController < ApplicationController
  include PresenterPattern::API[:html, :json]

  def index
    Foo.all
  end

  def show
    foo
  end

  def new
    Foo.new
  end

  def create
    Foo.create params[:foo]
  end

  def edit
    respond_opts :status => 206
    foo
  end

  def update
    foo.update_attributes(params[:foo]) if foo
  end

  def destroy
    foo.destroy if foo
  end

  private
  def foo
    @foo ||= Foo.find(params[:id])
  end
end
