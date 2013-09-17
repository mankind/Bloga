class Author < ActiveRecord::Base
  
  has_many :posts
  validates :name, :age, :presence => true
  validates :age, :numericality => {:only_integer => true}
end
