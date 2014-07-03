class MessagesController < ApplicationController
  
  
  def new
    @message = current_user.sent_messages.new
  end
  
  def create
    @user = current_user
    new_params = message_params
    new_params[:sender_id] = @user.id
    new_params[:receiver_id] = User.find_by_username(message_params[:receiver_id]).id
    @message = current_user.sent_messages.new(new_params)
  
    if @message.save
      flash[:notice] = "Message sent!"
      redirect_to @user
    else
      redirect_to @user
      flash.now[:errors] = @message.errors.full_messages
    end
  end
  
  def show
    @message = Message.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def index
    @messages = Message.all
  end
  
  private
  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :title, :body)
  end
end
