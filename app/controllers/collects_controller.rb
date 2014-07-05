class CollectsController < ApplicationController
  def create
    @collect = Collect.new
    @post = Post.find(params[:post_id])
    @collect.post_id = params[:post_id]
    @collect.user_id = current_user.id
    if @collect.save
      flash[:notice] = "Successfully collected!"
      redirect_to @post
    else
      flash[:errors] = ["Already collected!"]
      redirect_to @post
    end
  end
end
