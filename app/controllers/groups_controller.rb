class GroupsController < ApplicationController
  before_action :move_to_sign_in

  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group.id), notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを修正しました'
    else
      render :edit
    end
  end

private
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end


  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
