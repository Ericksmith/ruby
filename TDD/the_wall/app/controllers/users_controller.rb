class UsersController < ApplicationController
  def new
  end

  def index
    if session[:id] == nil
      redirect_to users_new_path
    end
    @posts = Post.all
    @user = User.find(session[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to messages_path
    else
      flash[:messages] = user.errors.full_messages
      redirect_to :back
    end
  end

  def create_post
    post = Post.new(post_params)
    if post.save
      redirect_to :back
    else
      flash[:post_error] = post.errors.full_messages
      redirect_to :back
    end
  end

  def create_comment
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to :back
    else
      flash[:messages] = comment.errors.full_messages
      redirect_to :back
    end
  end

  def logout
    session[:id] = nil
    redirect_to users_new_path
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end

    def post_params
      params.require(:post).permit(:content, :user_id)
    end

    def comment_params
      params.require(:comment).permit(:message, :post_id, :user_id)
    end
end
