class MessagesController < ApplicationController
  before_action :set_message, only: %i[index create]
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to group_messages_path, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_message
     @group = Group.find(params[:group_id])
  end

end
