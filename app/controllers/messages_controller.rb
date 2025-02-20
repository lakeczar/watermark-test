class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message uploaded successfully!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      flash[:notice] = "Record updated successfully!"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Message deleted successfully!"
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :description, :video, :thumbnail)
  end
end
