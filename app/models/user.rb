class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable,  :registerable,
  devise :database_authenticatable, :recoverable, :registerable,
           :rememberable, :trackable, :validatable
end
