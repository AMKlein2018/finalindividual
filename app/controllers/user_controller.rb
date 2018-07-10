class UserController < ApplicationController

  def update
    @user = current_user
    user_params[:category_ids].each do |id|
    	if id != ""
		    Favorite.create(user_id: @user.id, category_id: id)
    	end
    end
    redirect_to user_profile_path(@user)
  end

  protected

  def user_params
    params.require(:user).permit(category_ids: [])
  end



end
