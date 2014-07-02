module Api
  class CommentsController < ApiController
    def create
      @comment = Comment.new(params[:comment])
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
      render :json => @comment
    end
  end
end