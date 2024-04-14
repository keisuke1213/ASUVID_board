class Post < ApplicationRecord
  belongs_to :user
  self.inheritance_column = :_type_disabled
  enum type: { volunteer: 'ボランティア', event: 'イベント', announcement: 'お知らせ' }

  before_validation :clear_start_time_if_date_undecided
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 40}
  validates :title, presence: true

  
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  private

  def clear_start_time_if_date_undecided
    self.start_time = nil unless date_decided
  end
    
end
