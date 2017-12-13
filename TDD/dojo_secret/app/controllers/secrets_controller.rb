class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    secret = Secret.new(content:params[:Content], user_id:current_user.id)
    if secret.save
      redirect_to :back
    else
      flash[:errors] = secret.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    if Secret.find(params[:id]).destroy
      redirect_to user_path(current_user.id)
    else
      flash[:errors] = ["Unable to delete secret"]
      redirect_to :back
    end 
  end

  def update
    like = Like.new(user_id: current_user.id, secret_id:params[:id])
    if like.save
      redirect_to :back
    else
      flash[:errors] = ["Unable to like secret"]
      redirect_to :back
    end
  end
end
