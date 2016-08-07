class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :video
  validates :rating, presence: true
  validates_uniqueness_of :user_id, scope: [:video_id]

  scope :only_likes, -> { where(rating: 1) }

  # scope :newest_first, -> { order('created_at DESC') }
  #video.reactions.only_likes.newest_first
end
