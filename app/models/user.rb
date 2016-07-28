class User < ApplicationRecord
  has_many :videos
  has_many :user_categories
  has_many :categories, :through => :user_categories
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
    begin
      @video = get_random_video
    rescue
      self.get_next_video
    end
  end

  def get_random_video
    Video.find(1 + rand(Video.all.count))
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

  def category_update(new_categories_array)
    current_categories = self.get_category_ids
    new_categories = new_categories_array
    to_remove = current_categories - new_categories
    to_add = new_categories - current_categories

    to_remove.each { |id| self.remove_category(id) }

    to_add.each { |id| self.add_category(id) }


    # binding.pry
    # puts "add"
    # puts to_add
    # puts "remove"
    # puts to_remove
  end

end
