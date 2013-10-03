class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @notes = Note.all
    respond_with @notes
  end
  
  def show
  end
  
  def edit  
  end
  
  def create
    @note = Note.new(note_params)
    @note.save
    respond_with @note
  end
  
  def update
    @note.update(note_params)
    respond_with @note
  end
  
  def destroy
    @note.destroy
    respond_with @note
  end
    
  private
  
  def note_params
    params.require(:note).permit(:content, :private, :note_book_id)
  end
  
  def set_note
    #@note = Note.find_by(note_book_id: params[:note_book_id], id: params[:id])
    @note = Note.find(params[:id])
    respond_with @note
  end
end
