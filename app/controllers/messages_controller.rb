class MessagesController < ApplicationController
  before_action :set_message, only: %i[index create]
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    message = current_user.messages.new(message_params)
    if message.save
      redirect_to group_messages_path, notice: "投稿しました"
    else
      flash.index[:alert] = "投稿してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def set_message
     @group = Group.find(params[:group_id])
  end

end
