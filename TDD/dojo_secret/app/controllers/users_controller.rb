class UsersController < ApplicationController
  def new
  end

  def show
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def create
    user = User.new(user_params)
    if user.save && user.password_confirmation=params[:confirm_password]
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
