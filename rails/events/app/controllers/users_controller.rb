class UsersController < ApplicationController
  before_action :require_login, only: [:edit]

  def new
    @states = @@states
  end

  def create
    puts "hi"
    user = User.new(user_params)
    if user.save && user.password_confirmation=params[:confirm_password]
      session[:user_id] = user.id
      redirect_to events_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @current_user = User.find(params[:id])
    @states = @@states
  end
  
  def update
    user = current_user
    if user.update(update_params)
      redirect_to events_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
  end
end
