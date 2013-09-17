class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]
  # GET /authors
  # GET /authors.xml
  def index
    @authors = Author.all
    respond_with(@authors)
  end

  # GET /authors/1
  # GET /authors/1.xml
  def show
    respond_with(@author)
  end

  # GET /authors/new
  # GET /authors/new.xml
  def new
    @author = Author.new
    respond_with(@author)
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.xml
  def create
    @author = Author.new(author_params)
    @author.save
    respond_with(@author)
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @author.update(author_params)
    respond_with(@author)
  end

  # DELETE /authors/1
  # DELETE /authors/1.xml
  def destroy
    @author.destroy
    redirect_to authors_path
  end
  
  private
  
  def author_params
    params.require(:author).permit(:name, :age)
  end
  
  def set_author
    @author = Author.find(params[:id])
  end
end
