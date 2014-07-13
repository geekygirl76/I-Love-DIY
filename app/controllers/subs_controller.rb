class SubsController < ApplicationController
  before_action :require_owner, only: [ :destroy, :edit, :update]
  before_action :require_current_user, only: [:new, :create]

  def new
    @sub = current_user.subs.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      @sub = Sub.new
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show

    @sub = Sub.find(params[:id])

    render :show
  end

  def index
    @posts = Post.order(:score => :desc)
    @posts = (@posts.count > 3 ? @posts[0..2] : @posts)
    @subs = Sub.all
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :user_id)
  end

  def require_owner
    @sub = Sub.find(params[:id])
    unless @sub.manager == current_user
      flash[:errors] = ["You don't have the authority to perform this action!"]

      redirect_to subs_url
    end
  end
end
