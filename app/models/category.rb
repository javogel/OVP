class Category < ApplicationRecord
  has_many :video_categories, :dependent => :destroy_all
  has_many :user_categories, :dependent => :destroy_all
  has_many :videos, :through => :video_categories
  has_many :users, :through => :user_categories
  has_attached_file :category_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :category_image, presence: true



end
