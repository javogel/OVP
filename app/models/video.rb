class Video < ApplicationRecord
  belongs_to :user
  has_many :reactions, :dependent => :destroy
  has_many :video_categories, :dependent => :destroy
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




  def liked_by?(user_id)
    reaction_exists = User.find(user_id).reactions.exists?( :video_id => self.id)
    reaction = Reaction.where("user_id = ? AND video_id = ?", user_id, self.id )[0]
    if reaction_exists && (reaction["rating"] == 1)
      true
    else
      false
    end
  end

  def non_empty_reactions
    self.reactions.select{|reaction| !reaction["why_watch"].empty? }
  end


end
