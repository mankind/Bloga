class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :author_id
end
