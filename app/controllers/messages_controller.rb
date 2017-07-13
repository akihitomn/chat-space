class MessagesController < ApplicationController
  before_action :set_action, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group.id)
    else
      render :index, alert: 'メッセージが保存できませんでした。'
    end
  end

private
  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end

  def set_action
    @group = Group.find(params[:group_id])
  end

end
