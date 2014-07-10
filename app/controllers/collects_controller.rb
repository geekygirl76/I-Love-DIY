class CollectsController < ApplicationController
  def create

    @collect = Collect.new
    @user = current_user
    @post = Post.find(params[:post_id])
    @collect.post_id = params[:post_id]
    @collect.user_id = current_user.id
    if @collect.save
      flash[:notice] = "Successfully collected!"
      redirect_to @user
    else
      flash[:errors] = ["Already collected!"]
      redirect_to @post
    end
  end

  def index
    @collects = current_user.collects.all
  end
end
