class DojosController < ApplicationController
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
    @students = Student.where(dojo_id=params[:id])
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

  def destroy
    puts "In delete"
    if Dojo.find(params[:id]).destroy
      redirect_to '/dojos'
    else
      flash[:message] = ['Unable to destroy Dojo']
      redirect_to :back
    end
  end


  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
