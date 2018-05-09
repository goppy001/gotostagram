class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2200}
  validate :picture_size

  private

  #アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MBバイト未満の画像を選択してください")
    end
  end

  #画像が選択されているかバリデーションする
  def picture_existence
    if picture.size == 0.bytes
      errors.add(:picture, "画像を選択してください")
    end
  end

end
