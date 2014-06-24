class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
     
      log_in(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render:new
    end
  end
  
  def show
    @user = User.find(params[:id])
    if logged_in?
      render :show
    else
      redirect_to new_session_url
    end
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
