class CategoriesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def show
  	@category = Category.find(params[:id])
    @messages = Message.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to "/users"
  end



   def upvote
    @blog.upvote_from current_user
    redirect_to category_path

  end

  def downvote
    @blog.downvote_from current_user
    redirect_to category_path
  end


  private
  def categories_params
	params.require(:category).permit(:title, :blog_id, :user_id)
  end


end
