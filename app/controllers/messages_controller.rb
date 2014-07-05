class MessagesController < ApplicationController

  def senddraft
    @message = Message.find(params[:id])
    @message.change_draft
    flash[:notice] = "Message sent!"
    redirect_to @message
  end

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
    @message = Message.find(params[:id])

  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to @message
    else
      flash[:errors] = @message.errors.full_messages
      render :edit
    end
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
