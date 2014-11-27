class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :hashtag_id
      t.text :tag

      t.timestamps
    end
  end
end
