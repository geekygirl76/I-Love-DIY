module Api
  class PostsController < ApiController
    before_action :require_current_user, except: [:index]
    before_action :require_owner, only: [:edit, :update, :destroy]

    def upvote
      @post = Post.find(params[:id])
      if @post

        @voterecord = Voterecord.new(user_id: current_user.id, post_id: @post.id)
        if @voterecord.save
          @post.add_score
          render "show"
        else
          render json: { errors: @post.errors.full_messages }, status: 422;
        end
      else

        render json: { errors: @post.errors.full_messages }, status: 422;
      end


    end

    def downvote
      @post = Post.find(params[:id])
      if @post

        @voterecord = Voterecord.new(user_id: current_user.id, post_id: @post.id)
        if @voterecord.save
          @post.down_score
          render "show"
        else
          render json: { errors: @post.errors.full_messages }, status: 422;
        end
      else

        render json: { errors: @post.errors.full_messages }, status: 422;
      end


    end

    def create
      @post = current_user.posts.new(post_params)

      if (@post.sub.nil?)
        render json: { errors: @post.errors.full_messages }, status: 422
      else
        if @post.save

          render "show"
        else
          render json: { errors: @post.errors.full_messages }, status: 422

        end
      end
    end

    def index


      @posts = Post.all

      render "index"

    end

    def show

      @post = Post.find(params[:id])
      @comments = @post.comments


      render "show"
    end

    def edit
      @post = Post.find(params[:id])
      render "show"
    end

    def update
      @post = Post.find(params[:id])

      if @post.update_attributes(post_params)
        render "show"
      else

        render json: { errors: @post.errors.full_messages }, status: 422
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      render json: @posts
    end

    private



    def post_params
      params.require(:post).permit(:title, :body, :sub_id, :user_id, :channel_id, :photo)
    end

    def require_owner
      @post = Post.find(params[:id])
      @posts = Post.all
      unless @post.user_id == current_user.id

        render json: @post
      end
    end

  end
end