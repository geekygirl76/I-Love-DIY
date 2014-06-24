class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_credentials(user_params[:username],user_params[:password])
    
    if @user
      log_in(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid Username Or Password"]
      @user = User.new
      render :new
    end
  end
  
  def destroy
    
    log_out
    redirect_to new_session_url
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
  
end
