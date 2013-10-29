class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :authentication_token
  embed :ids, include: true
  has_many :note_books
end
