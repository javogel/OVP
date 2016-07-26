class Video < ApplicationRecord
  belongs_to :user
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true


  
end
