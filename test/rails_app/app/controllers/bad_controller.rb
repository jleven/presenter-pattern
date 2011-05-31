class BadController < ApplicationController
  include PresenterPattern::API[:html, :json]
  layout nil

  def good
    Foo.find(params[:id])
  end

  def empty
  end

  def query
  end

  def vars
    @not_data = "I can see this in the view!"
    nil
  end

  def explicit
    render :action => :empty
    Foo.first
  end
end
