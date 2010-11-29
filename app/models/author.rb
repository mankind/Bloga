class Author < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :registerable,  :confirmable and :activatable
  devise :database_authenticatable,  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :age,  :email, :password, :password_confirmation

  has_many :posts
  validates :name, :age, :presence => true
end
