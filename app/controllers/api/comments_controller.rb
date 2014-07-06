module Api
  class CommentsController < ApiController
    before_filter :require_current_user

    def create
      @comment = current_user.comments.new(comment_params)
      if @comment.save
        render :json=> @comment
      else
        render :json=> @comment.errors, :status => :unprocessable_entity
      end
    end


    def index
      @comments = Comment.where(:post_id => params[:post_id])
      render json: @comments
    end

    def show
      @comment = Comment.find(params[:id])
       # render :json => @comment
       render "show"
    end

    private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :parent_comment_id)
    end
  end
end