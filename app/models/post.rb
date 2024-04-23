class Post < ApplicationRecord
  belongs_to :user
  self.inheritance_column = :_type_disabled
  enum type: { volunteer: 'ボランティア', event: 'イベント', announcement: 'お知らせ' }






  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/image.jpg')
      image.attach(io: File.open(file_path), filename: 'image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end



  def clear_start_time_if_date_undecided
    self.start_time = nil unless date_decided
  end

end
