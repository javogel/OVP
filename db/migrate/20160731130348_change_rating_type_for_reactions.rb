class ChangeRatingTypeForReactions < ActiveRecord::Migration[5.0]

   def up
       change_column :reactions, :rating, 'integer USING CAST(rating AS integer)'
   end

end
