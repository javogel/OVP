class User < ApplicationRecord
  has_many :videos
  has_many :reactions
  has_many :user_categories
  has_many :categories, :through => :user_categories

  has_many :followers, :class_name => 'Follow', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follow', :foreign_key => 'follower_id'
  # In order to do User.find(1).followers.push(User.last) would the below code work?
  # has_many :users, :through => :followers
  # has_many :users, :through => :following

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

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


  def get_next_video
    random_video_id = Video.pluck(:id).sample
    Video.find(random_video_id)
  end


  def add_category(category_id)
    self.categories.push(Category.find(category_id))
  end

  def remove_category(category_id)
    self.categories.delete(Category.find(category_id))
  end

  def get_category_ids
    category_array = self.categories.map {|category| category.id}
  end




  def name
    self.first_name + " " + self.last_name
  end

end
