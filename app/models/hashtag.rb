class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:99}
  has_many  :microposts, through: :micropost_hashtags
  has_many  :micropost_hashtags, dependent: :destroy
end
