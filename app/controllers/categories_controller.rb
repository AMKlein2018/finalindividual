class CategoriesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  	@category = Category.find(params[:id])
  end



  private
  def categories_params
	params.require(:category).permit(:title, :blog_id, :user_id)
  end


end
