class SessionsController < ApplicationController

  def demo
    @user = User.find(1)
    @user.password = @user.username
    log_in(@user)
    redirect_to "/"
  end

  def new
    @user = User.new
  end

  def facebook_login

     user = User.find_or_create_by_auth_hash(request.env['omniauth.auth'])

     log_in(user)


     redirect_to "/"
   end

  def create
    @user = User.find_by_credentials(user_params[:email],user_params[:password])

    if @user
      log_in(@user)
      redirect_to root_url

    else
      @user = User.new
      render json: { errors: @user.errors.full_messages }, status: 422;


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
