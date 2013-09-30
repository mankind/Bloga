class NoteBooksController < ApplicationController
  before_action :set_note_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @note_books = NoteBook.order("created_at desc")
  end
  
  private
  
  def note_book_params
    params.require(:note_book).permit(:name)
  end
  
  def set_note_book
    @note_book = NoteBook.find(params[:id])
  end
  
end
