class CreateVideoCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :video_categories, :id => false do |t|
      t.references :video, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :video_categories, [:video_id, :category_id], :unique => true
  end
end
