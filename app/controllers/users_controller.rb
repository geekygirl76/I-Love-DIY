class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create


    @user = User.new(user_params)

    if !@user.password_match
      flash.now[:errors] = ["Password don't match!"]
      render :new
    elsif @user.save

      UserMailer.activation_email(@user).deliver!
      redirect_to subs_url, notice:"Successfully created your account! Check your inbox for an activation email."
    else
      flash.now[:errors] = @user.errors.full_messages
      render:new
    end
  end

  def activate
    @user = User.find_by_activation_token(params[:activation_token])

    if @user
      @user.activate!
      log_in(@user)
      redirect_to subs_url, notice: "Welcome!" + @user.username
    else
      flash.now[:errors] = "Invalid activation!"
      redirect_to subs_url
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

  def index
    @users = User.all
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
    params.require(:user).permit(:username, :password, :email, :activation_token, :activated,:confirm_password, :photo, :age, :gender, :zip)
  end
end
