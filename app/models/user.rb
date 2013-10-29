class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #source in app/models/concerns
  include TokenAuthenticatable
  
  #added via  activerecord-mongoid-association gem
  include AddsHasManyMongoidToActiveRecord
  
  has_many_mongoid_documents :note_books
end
