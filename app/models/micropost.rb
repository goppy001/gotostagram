class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2200}
  validate :picture_size
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :hashtags, through: :micropost_hashtags
  has_many :micropost_hashtags, dependent: :destroy

 #マイクロポストをいいねする
  def favorite(user)
    favorites.create(user_id: user.id)
  end

  #マイクロポストのいいねを解除する
  def unfavorite(user)
    favorites.find_by(user_id: user.id).destroy
  end

  #現在のユーザーがいいねしてたらtrueを返す
  def favorite?(user)
    favorite_users.include?(user)
  end

    private

  #アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MBバイト未満の画像を選択してください")
    end
  end
end
