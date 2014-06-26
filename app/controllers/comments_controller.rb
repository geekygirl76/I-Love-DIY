class CommentsController < ApplicationController
  before_action :require_current_user, only: [:new, :create]
  
  def new
    
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:body, :parent_comment_id, :post_id, :user_id)
  end
end
