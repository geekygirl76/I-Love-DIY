class ChannelsController < ApplicationController
  before_action :require_current_user, except: [:show, :index]
  
  def new
    @sub = Sub.find(params[:sub_id])
    @channel = @sub.channels.new
  end
  
  def create
    
    @sub = Sub.find(params[:sub_id])
    @channel = @sub.channels.new(channel_params)
    @channel.sub_id = @sub.id
    
    if @channel.save
      redirect_to @channel
    else
      flash.now[:errors] = @channel.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @channel = Channel.find(params[:id])
    @sub = @channel.sub
    @channel.destroy
    redirect_to @sub
  end
  
  def show
    @channel = Channel.find(params[:id])
  end
  
  
  private
  
  def channel_params
    params.require(:channel).permit(:title, :sub_id)
  end
  
  
end
