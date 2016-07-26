class AddWhyToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :why_watch, :string
    add_column :videos, :youtube_id, :string
  end
end
