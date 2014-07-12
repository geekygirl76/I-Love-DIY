class PostsController < ApplicationController
  before_action :require_current_user, except: [:index]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def upvote
    @post = Post.find(params[:id])
    if @post

      @voterecord = Voterecord.new(user_id: current_user.id, post_id: @post.id)
      if @voterecord.save
        @post.add_score
        redirect_to @post
      else
        flash[:errors] = @voterecord.errors.full_messages
        redirect_to @post
      end
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to @post
    end

  end

  def downvote
    @post = Post.find(params[:id])
    if @post

      @voterecord = Voterecord.new(user_id: current_user.id, post_id: @post.id)
      if @voterecord.save
        @post.down_score
        redirect_to @post
      else
        flash[:errors] = @voterecord.errors.full_messages
        redirect_to @post
      end
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to @post
    end
  end

  def new

    @post = Post.new

  end

  def create

    @post = Post.new(post_params)

    @post.user_id = current_user.id
    if (@post.sub && @post.channel.nil?)
      render :new
    else
      if @post.save
        redirect_to @post
      else
        flash.now[:errors] = @post.errors.full_messages
        render :new
      end
    end
  end

  def index
    if( params[:post].nil? || params[:post][:search] == "")
      @posts = Post.order(:created_at => :desc).page(params[:page]).per(3)
    else
      @posts = Post.search_by_title_and_body(post_params[:search]).order(:score => :desc).page(params[:page]).per(3)
    end

  end

  def show

    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
   
    if @post.update_attributes(post_params)
      redirect_to @post
    else

      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @sub = @post.sub
    redirect_to posts_url
  end

  def personal
    @posts = current_user.posts.all.page(params[:page]).per(3)
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :sub_id, :user_id, :channel_id, :photo, :search)
  end

  def require_owner
    @post = Post.find(params[:id])

    unless @post.user_id == current_user.id || current_user.id == 2
      flash[:errors] = ["Only submitter of this post can implement this action!"]
      redirect_to posts_url
    end
  end
end
