class Post < ActiveRecord::Base
  
 include AddsHasManyMongoidToActiveRecord
 has_many_mongoid_documents :note_books
  
 has_many :comments
 belongs_to :author
 
 validates_presence_of :title
 validates_presence_of :body
end
