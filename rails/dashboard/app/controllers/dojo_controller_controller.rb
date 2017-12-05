class DojoControllerController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
  end

  def create
    dojo = Dojo.new(dojo_params)
    if dojo.save
      flash[:message] = ["New Dojo Created!"]
      redirect_to :back
    else
      flash[:message] = dojo.errors.full_messages
      redirect_to :back
    end
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
