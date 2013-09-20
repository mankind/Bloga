class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  
  #to ensure only authenticated authors can post to the blog
  #change the respond_to :html to respond_to :only => :index
  respond_to :atom, :only => :index
  
  def index
    @posts = Post.order("created_at desc")
    #@posts = Post.all
    respond_with @posts
  end
  
  def show
    respond_with @post
  end
  
  def new
  @post = Post.new
  end
  
  #to make devise gem use the current author change Post.new(params[:post]) to current_author.posts.build(params[:posts])
  def create
	  if params[:mail]
      Emailer.receive(source)
    elsif
     #@post = current_author.posts.build(params[:post])
      @post = Post.new(post_params)
	    @post.save
      PostMailer.post_created.deliver
	    respond_with(@post)
     else
      render :action => "new"
	   end
	end
	
	def edit
    @post = Post.find_by(id: params[:id])
	end
	
	def update
	  @post.update(post_params)
	  respond_with(@post)
	end
	
	def destroy
	  @post.destroy
    redirect_to posts_path
	end
  
  def post_params
    params.require(:post).permit(:body, :title, :author_id)
  end
  
  def set_post
     @post = Post.find_by(id: params[:id])
  end
end