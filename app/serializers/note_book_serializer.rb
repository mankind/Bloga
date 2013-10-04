class NoteBookSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  embed :ids, include: true
  has_many :posts
  has_many :notes
end
