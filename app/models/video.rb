class Video < ApplicationRecord
  belongs_to :user
  has_many :video_categories
  has_many :categories, :through => :video_categories
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true


  def self.create_video(video_url, user_id)
    begin
      video = Yt::Video.new url: video_url
      embed_code = video.embed_html
      name = video.title
      id = video.id
      Video.create(name: name, url: video_url, video_embed: embed_code, user_id: user_id, youtube_id: id)
    rescue
      #"Youtube API Error: #{e.message}"
      "We had a problem processing the link. Please make sure it is correct and try again."
    end
  end
end
