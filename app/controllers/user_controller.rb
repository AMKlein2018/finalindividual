class UserController < ApplicationController

  def update
    @user = current_user
    redirect_to root_path if @user.update(user_params)
  end

  protected

  def user_params
    params.require(:user).permit(category_ids: [])
  end



end
