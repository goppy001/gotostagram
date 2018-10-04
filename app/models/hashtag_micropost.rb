class HashtagMicropost < ApplicationRecord
  belongs_to :micropost
  belongs_to :Hashtag
end
