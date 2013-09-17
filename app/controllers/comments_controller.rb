class CommentsController < ApplicationController
  before_action :set_post_for_comment
 def create
	#@post.comments.create(params[:comment])
   @post.comments.create(comment_params)
	redirect_to @post
	end
	
	def destroy
    comment = Comment.find_by(id: params[:id])
	  comment.destroy
	  redirect_to @post
	end
  
  private
  
  def comment_params
    params.require(:comment).permit(:author, :body, :post_id)
  end
  def set_post_for_coment
     @post = Post.find_by(id: params[:post_id])
  end
  
end
