class UserController < ApplicationController

  def update
    @user = current_user
    @user.favorites.each do |favorite|
      favorite.destroy
    end
    user_params[:category_ids].each do |id|
    	if id != ""
		    Favorite.create(user_id: @user.id, category_id: id)
    	end
    end
    redirect_to user_profile_path(@user)
  end

  def destroy

  end


  protected

  def user_params
    params.require(:user).permit(category_ids: [])
  end



end
