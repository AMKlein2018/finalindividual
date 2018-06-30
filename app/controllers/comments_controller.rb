class CommentsController < ApplicationController
  	def index
    	@comments = Comment.all
  	end
  	def new
    	@comment = Comment.new
  	end

	def create
		user = current_user
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		blog = Blog.find(params[:blog_id])
		@comment.blog_id = blog.id
		# @comment = @blog.comments.build(params[:comment])
		if @comment.save
			redirect_to "/blogs/#{params[:blog_id]}"
		else
			render "/blogs/#{params[:blog_id]}"
		end
	end


	def show
		@comment = Comment.find(params[:id])

	end

	def edit
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.find(params[:id])
	end

	
	def update
  		@blog = Blog.find(params[:blog_id])
  		@comment = @blog.comments.find(params[:id]) 
  		if @comment.update(comment_params)
    		redirect_to blog_path(@blog)
  		else
    		render :action => :edit
  		end   
	end




	def destroy
	  @blog = Blog.find(params[:blog_id])
	  @comment = @blog.comments.destroy(params[:id]) 
	redirect_to blog_path(@blog)  
 	end





	private
	
	def comment_params
		params.require(:comment).permit(:content, :user_id, :blog_id)
	end



end
