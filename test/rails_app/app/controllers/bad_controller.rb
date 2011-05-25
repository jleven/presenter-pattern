class BadController < ApplicationController
  include PresenterPattern::API[:html, :json]

  def good
    Foo.find(params[:id])
  end

  def empty
  end

  def query
  end

  def no_vars
    @not_data = "Can't see this in the view!"
    nil
  end

  def explicit
    render :action => :empty
    Foo.first
  end
end
