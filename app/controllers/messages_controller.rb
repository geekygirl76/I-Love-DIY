class MessagesController < ApplicationController


  def new

    @message = current_user.sent_messages.new
  end

  def create
    @user = current_user
    message_params[:sender_id] = @user.id


    @message = current_user.sent_messages.new(message_params)

    if @message && @message.save
      if @message.draft == "N"
        flash[:notice] = "Message sent!"
      elsif @message.draft == "Y"
        flash[:notice] = "Message saved!"
      end
      redirect_to @user
    else

      flash.now[:errors] = @message.errors.full_messages
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
      redirect_to messages_url
    end
  end



  private
  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :title, :body, :draft)
  end
end
