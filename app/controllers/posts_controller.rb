class PostsController < ApplicationController

  #to ensure only authenticated authors can post to the blog
  #change the respond_to :html to respond_to :only => :index
  respond_to :atom, :only => :index
  #add a before filter to invoke devise helper to authenticate all except the [:index, :show]
  before_filter :authenticate_author!, :except => [:index, :show]
  
  def index
  @posts = Post.order("created_at desc")
  #@posts = Post.all
  
  respond_with @posts
  end
  
  def show
  @posts = Post.find_by_id(params[:id])
  respond_with @post
  end
  
  def new
  @post = Post.new
  end
  
  #to make devise gem use the current author change Post.new(params[:post]) to current_author.posts.build(params[:posts])
  def create
    
	if params[:mail]
    Emailer.receive(source)
 else
    @post = current_author.posts.build(params[:post])
	
    @post.save
	respond_with(@post)
	  end
	end
	
	def edit
	@post = Post.find_by_id(params[:id])
	end
	
	def update
	@post = Post.find_by_id(params[:id])
	@post.update_attributes(params[:post])
	respond_with(@post)
	
	#all the flash msg under this were commented out because respond_with inserts it automatically.
	#redirect_to posts_parh
	#else
	 # render "new"
	  # end
	end
	
	def destroy
	@post = Post.find_by_id(params[:id])
	@post.destroy
	respond_with(@post)
	end
end