class AddNoteBookIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :note_book_id, :integer
  end
end
