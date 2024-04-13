class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :posts, dependent: :destroy
  has_many :expressions, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  
end
