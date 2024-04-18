class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :posts, dependent: :destroy
  has_many :expressions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :profile_image, presence: true
  validates :grade, presence: true
  validates :course, presence: true
  validates :group, presence: true
  validates :line_name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile.image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile.image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile.image.variant(resize_to_limit: [width, height]).processed
  end
  
end
