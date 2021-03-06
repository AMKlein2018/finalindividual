class BlogsController < ApplicationController
  before_action :index, :show, only:[:upvote, :downvote]
  before_action :authenticate_user!

  require 'news-api'
  
  def index
  	@blogs = Blog.all.order(:cached_votes_score => :desc)
    @messages = Message.all

  end

  def new
  	@blog = Blog.new
  end

  def create
  	
    @blog = Blog.new(blog_params)
  	@blog.user_id = current_user.id

  	if @blog.save
  		redirect_to "/"
  	else
  		render "/blogs/new"
  	end
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        redirect_to "/blogs"
      else
        render edit_blog_path
      end
    end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to "/blogs"
  end

  def upvote
    @blog.upvote_from current_user
    redirect_to blogs_path

  end

  def downvote
    @blog.downvote_from current_user
    redirect_to blogs_path
  end

  def landing
    
  end

  def api
    $newsapi = News.new("c1f1d9a225f348baab718198cab1037e")
    @top_headlines=$newsapi.get_top_headlines(sources: "espn")

    # if @top_headlines.save
    #   redirect_to "/profile/:id"
    # else
    #   render "/api"
    # end

  end

 

	private
def blog_params
	params.require(:blog).permit(:title, :content, :category_id, :user_id, :image, :remove_image)
end

end
