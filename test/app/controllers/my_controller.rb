class MyController < ApplicationController
  def show
    @data = Foo.find(params[:id])
  end

  def index
    @data = Foo
  end
end