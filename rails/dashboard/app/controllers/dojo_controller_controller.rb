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

  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    dojo = Dojo.find(params[:id])
    if dojo.update(dojo_params)
      redirect_to "/dojos/#{dojo[:id]}"
    else
      flash[:message] = dojo.errors.full_messsages
      redirect_to :back
    end
  end


  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
