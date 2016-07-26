class Video < ApplicationRecord
  belongs_to :user
  has_many :video_categories
  has_many :categories, :through => :video_categories
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true


  def self.create_video(video_url, user)
    video = Yt::Video.new url: video_url
    embed_code = video.embed_html
    name = video.title
    id = video.id
    Video.create(name: name, url: video_url, video_embed: embed_code, user: user, youtube_id: id)
  end
end
