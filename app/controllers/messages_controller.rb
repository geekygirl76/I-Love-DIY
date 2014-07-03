class MessagesController < ApplicationController
  
  
  def new
    @message = current_user.sent_messages.new
  end
  
  def create
    @user = current_user
    new_params = message_params
    new_params[:sender_id] = @user.id
    receiver = User.find_by_username(message_params[:receiver_id])
    if receiver
      new_params[:receiver_id] = receiver.id
      @message = current_user.sent_messages.new(new_params)
  
      if @message && @message.save
        flash[:notice] = "Message sent!"
        redirect_to @user
      else
      
        flash.now[:errors] = @message.errors.full_messages
        redirect_to @user
      end
    else
      flash[:errors] = ["Receiver does not exist!"]
      redirect_to @user
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
  
  def open
    @message = Message.find(params[:id])
    if @message
      @message.read_letter
      redirect_to @message
    else
      flash.now[:errors] = @message.errors.full_messages
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :title, :body)
  end
end
