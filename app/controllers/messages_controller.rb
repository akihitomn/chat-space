class MessagesController < ApplicationController

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    Message.create(message_params)
  end

private
  def message_params
    params.require(:message).permit(:message, user_id: current_user.id, group_id: params[:group_id])
  end

end
