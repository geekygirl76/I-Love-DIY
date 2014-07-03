class MessagesController < ApplicationController
  
  
  def new
    @message = current_user.sent_messages.new
  end
  
  def create
    @user = current_user
    params[:receiver_id] = User.find_by_username(params[:receiver_id]).id
    @message = current_user.sent_messages.new(message_params)
    if @message.save
      flash[:notice] = [""]
      redirect_to @message
    else
      redirect_to @user
      flash.now[:errors] = @message.errors.full_messages
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def index
  end
  
  private
  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :title, :body)
  end
end
