class CreateUserCategories < ActiveRecord::Migration[5.0]

  def change
    create_table :user_categories, :id => false do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :user_categories, [:user_id, :category_id], :unique => true
  end

end
