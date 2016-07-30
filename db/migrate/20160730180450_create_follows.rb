class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :follows, [:follower_id, :user_id], :unique => true
  end
end
