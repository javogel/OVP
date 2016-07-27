class Category < ApplicationRecord
  has_many :video_categories
  has_many :user_categories
  has_many :videos, :through => :video_categories
  has_many :users, :through => :user_categories
  has_attached_file :category_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :category_image, presence: true
  # attr_accessor :category_image


end
