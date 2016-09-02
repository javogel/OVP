class CategoryDescribe < ApplicationRecord
  belongs_to :video
  belongs_to :user
  belongs_to :category

  
end
