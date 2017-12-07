class PostsController < ApplicationController
  def index
    @users = User.all
    @posts = Post.joins(:user)
    render layout: 'three_column'
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to :back
    else
      flash[:message] = post.errors.full_messages
      redirect_to :back
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
