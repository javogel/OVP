class User < ApplicationRecord
  has_many :videos
  has_many :reactions
  has_many :user_categories
  has_many :categories, :through => :user_categories

  has_many :followers, :class_name => 'Follow', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follow', :foreign_key => 'follower_id'


  has_many :category_describes




  validates :first_name, :last_name, :email, presence: true
  # validates :email, uniqueness: true

  class << self
    def from_omniauth(auth_hash)

      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

      user.first_name = auth_hash['info']['first_name']
      user.last_name = auth_hash['info']['last_name']
      user.image_url = auth_hash['info']['image']
      user.email = auth_hash['info']['email']
      user.url = auth_hash['info']['urls'][user.provider.capitalize]

      user.save!

      user

    end
  end


  def get_next_video(last_seen_video_ids)

    candidate_video_ids = [
      videos_from_categories_ids,
      videos_from_following_ids,
      videos_liked_following_ids
    ].flatten.uniq

    last_seen_video_ids.map! {|id| id.to_i}

    candidate_video_ids -= last_seen_video_ids

    Video.find_by(id: candidate_video_ids.sample) ||
      Video.get_random
  end




  def add_category(category_id)
    self.categories.push(Category.find(category_id))
  end

  def remove_category(category_id)
    self.categories.delete(Category.find(category_id))
  end

  def get_category_ids
    categories.pluck(:id)
  end

  def name
    self.first_name + " " + self.last_name
  end

  private



  def videos_from_categories_ids
    Video.
      joins(:video_categories).
      where("video_categories.category_id IN (?)", get_category_ids).
      pluck(:id)
  end

  def videos_from_following_ids

    Video.
      where(user_id: following.pluck(:user_id)).
      pluck(:id)


  end

  def videos_liked_following_ids

    Video.
      joins(:reactions).
      where("reactions.user_id IN (?)", following.pluck(:user_id)).
      where("reactions.rating > ?", 0).
      pluck(:id)

  end

end
