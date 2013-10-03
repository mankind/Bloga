class Post < ActiveRecord::Base
  
  include AddsBelongsToMongoidToActiveRecord
  belongs_to_mongoid_document :note_book
 
  
 has_many :comments
 belongs_to :author
 
 validates_presence_of :title
 validates_presence_of :body
end
