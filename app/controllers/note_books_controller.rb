class NoteBooksController < ApplicationController
  before_action :set_note_book, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  
  def index
    #@note_books = NoteBook.order("created_at desc")
    @note_books = NoteBook.all
    #respond_with @note_books
    #@notes = Note.all
    #respond_with @notes
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @note_book = NoteBook.new(note_book_params)
    @note_book.save
    respond_with @note_book
  end
  
  def update
    @note_book.update(note_book_params)
    respond_with @note_book
  end
  
  def destroy 
    @note_book.destroy
    respond_with @note_book
  end
  
  private
  
  def note_book_params
    params.require(:note_book).permit(:name, :user_id)
  end
  
  def set_note_book
    @note_book = NoteBook.find(params[:id])
    respond_with @note_book
  end
  
end
