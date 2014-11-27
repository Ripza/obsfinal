class CreateTweetsPalClaves < ActiveRecord::Migration
  def change
    create_table :tweets_pal_claves do |t|
      t.integer :tweet_id
      t.integer :palabra_clave_id

      t.timestamps
    end
  end
end
