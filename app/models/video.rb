class Video < ApplicationRecord
  belongs_to :user
  has_many :reactions
  has_many :video_categories
  has_many :categories, :through => :video_categories
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true

  def self.build_from_youtube(url)
    begin
      youtube_video = Yt::Video.new url: url

      Video.new video_embed: youtube_video.embed_html,
        name: youtube_video.title,
        url: url,
        youtube_id: youtube_video.id
    rescue Yt::Errors::RequestError
    end
  end
end
