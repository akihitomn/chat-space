class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/", notice: 'グループを作成しました'
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
      redirect_to "/", notice: 'グループを修正しました'
    else
    end
  end

private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
