class DisplayController < ApplicationController
  def index
    @users = User.all
  end

  def new
    render :new
  end
  
    def show
      @user = User.find(params[:id])
    end
  
    def total
      @total = User.count
    end

  def edit
    @user = User.find(params[:id])
  end

  def add_user
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def update_user
    @user = User.update(params[:id], user_params)
    if @user.save
      redirect_to "/users"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
