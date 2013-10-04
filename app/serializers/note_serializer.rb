class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :private, :note_book_id
end
