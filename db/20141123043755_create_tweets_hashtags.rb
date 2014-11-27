class CreateTweetsHashtags < ActiveRecord::Migration
  def self.up
    create_table :tweets_hashtags, :id => false do |t|
      t.integer :tweet_id
      t.integer :hashtag_id

      t.timestamps
    end
  end
  def self.down
    drop_table:tweets_hashtags
  end
end
