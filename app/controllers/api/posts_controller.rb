module Api
  class PostsController < ApiController
    before_action :require_current_user, only: [:new, :create]
    before_action :require_owner, only: [:edit, :update, :destroy]



    def create

      @post = Post.new(post_params)

      @post.user_id = current_user.id
      if (@post.sub && @post.channel.nil?)
        render json: { errors: @post.errors.full_messages }, status: 422
      else
        if @post.save
          render json: @post
        else
          render json: { errors: @post.errors.full_messages }, status: 422

        end
      end
    end

    def index
      @posts = Post.all
      render json: @posts
    end

    def show

      @post = Post.find(params[:id])
      render json: @post
    end

    def edit
      @post = Post.find(params[:id])
      render json: @post
    end

    def update
      @post = Post.find(params[:id])

      if @post.update_attributes(post_params)
        render json: @post
      else

        render json: { errors: @post.errors.full_messages }, status: 422
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      @sub = @post.sub
      render json: @sub
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :sub_id, :user_id, :channel_id, :photo)
    end

    def require_owner
      @post = Post.find(params[:id])

      unless @post.user_id == current_user.id || current_user == @post.sub.manager
        flash[:errors] = ["Only submitter of this post can implement this action!"]
        redirect_to post_url(@post)
      end
    end

  end
end