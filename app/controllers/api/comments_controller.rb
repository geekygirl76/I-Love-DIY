module Api
  class CommentsController < ApiController
    before_action :require_current_user, only: [:new, :create]



    def create

      if params[:comment_id].nil?
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
      else
        @parent_comment = Comment.find(params[:comment_id])
        @comment = @parent_comment.child_comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = @parent_comment.post_id
        @post = Post.find(@parent_comment.post_id)
      end

      if @comment.save
        render json: @post
      else
        render json: { errors: @comment.errors.full_messages }, status: 422
        if @comment.post_id
          render json: @post
        else
          render :new
        end

      end
    end



    private
    def comment_params
      params.require(:comment).permit(:body, :parent_comment_id, :post_id, :user_id)
    end

  end
end