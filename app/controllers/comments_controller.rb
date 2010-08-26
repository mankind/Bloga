class CommentsController < ApplicationController
 before_filter do
  @post = Post.find_by_id(params[:post_id])
  end
 def create
	@post.comments.create(params[:comment])
	redirect_to @post
	end
	
	def destroy
	  comment = Comment.find_by_id(params[:id])
	  comment.destroy
	  redirect_to @post
	end
end
