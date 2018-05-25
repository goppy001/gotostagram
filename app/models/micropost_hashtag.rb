class MicropostHashtag < ApplicationRecord
  belongs_to :micropost
  belongs_to :Hashtag
  validates  :micropost_id, presence: true
  validates  :Hashtag_id,   presence: true
end
