class UsersController < ApplicationController
  def new
  end

  def show
    @secrets = Secret.where(user_id: current_user.id)
    # @liked_secrets = Secret.joins(:like).where(likes.user_id: current_user.id )
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

  def update
    user = User.find(params[:id])
    if user.update_attributes(update_params)
      redirect_to user_path(user.id)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def destroy
    user = current_user
    if user.destroy
      session[:user_id] = nil
      redirect_to new_user_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def update_params
      params.require(:user).permit(:name, :email)
    end
end
