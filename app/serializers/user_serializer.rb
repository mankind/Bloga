class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  embed :ids, include: true
  has_many :note_books
end
