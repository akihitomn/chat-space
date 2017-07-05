class UsersController < ApplicationController
  layout 'application'
  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice]= "success"
      redirect_to root_path
    else
      render :edit
    end
  end

private
  def user_params
    params.permit(:name, :email)
  end

end
