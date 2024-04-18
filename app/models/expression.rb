class Expression < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  self.inheritance_column = :_type_disabled
  enum type: { volunteer: 'ボランティア', event: 'イベント', other: 'その他' }
  
  
  
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 50}
  
  has_one_attached :exp_image
  
  def get_exp_image(width, height)
    unless exp_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      exp_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    exp_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
end
