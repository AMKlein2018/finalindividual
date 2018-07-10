class ProfileController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@messages = Message.all
  end



end
