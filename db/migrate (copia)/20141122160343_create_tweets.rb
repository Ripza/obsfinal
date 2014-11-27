class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :id
      t.text :tweet_texto
      t.timestamps :creacion_tweet
      t.text :recurso

      t.timestamps
    end
  end
end
