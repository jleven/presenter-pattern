class BarsController < ApplicationController
  include PresenterPattern
  layout nil

  respond_to :html, :json

  def show
    @data = Bar.find(params[:id])
    respond_with(@data)
  end

  def index
    @data = Bar
  end

  def edit
    @not_data = "Can't see this in the view!"
  end
end