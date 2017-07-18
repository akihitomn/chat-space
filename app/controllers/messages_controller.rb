class MessagesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_group, only: [:index, :create]

  def index
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group.id) }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージか画像を入力して下さい'
      render :index
    end
  end

private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
