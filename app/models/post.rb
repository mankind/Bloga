class Post < ActiveRecord::Base
 has_many :comments
 belongs_to :author
 
 validates_presence_of :title
 validates_presence_of :body
end
