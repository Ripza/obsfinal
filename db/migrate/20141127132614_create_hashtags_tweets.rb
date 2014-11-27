class CreateHashtagsTweets < ActiveRecord::Migration
  def change
    create_table :hashtags_tweets do |t|
      t.integer :tweet_id
      t.integer :hashtag_id

    end
  end
end
