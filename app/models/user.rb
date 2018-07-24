class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  has_many :blogs, dependent: :destroy
  has_many :comments
  has_many :favorites
  has_many :categories, through: :favorites
  has_many :chatroom_users
  has_many :chatrooms, through: :chatrooms_users
  has_many :messages
  

end
