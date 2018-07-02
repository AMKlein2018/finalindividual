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

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to "/users"
  end


  private
  def categories_params
	params.require(:category).permit(:title, :blog_id, :user_id)
  end


end
