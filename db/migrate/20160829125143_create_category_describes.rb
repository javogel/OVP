class CreateCategoryDescribes < ActiveRecord::Migration[5.0]
  def change
    create_table :category_describes do |t|
      t.references :video, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
