class PostsController < ApplicationController
  before_action :require_current_user, only: [:new, :create]
  before_action :require_owner, only: [:edit, :update, :destroy]
  
  def new
    @sub = Sub.find(params[:sub_id])
    @pot = @sub.posts.new
  end
  
  def create
    @sub = Sub.find(params[:sub_id])
    @post = @sub.posts.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def index
    
  end

  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :sub_id, :user_id)
  end
  
  def require_owner
    @post = Post.find(params[:id])
    
    
  end
end
