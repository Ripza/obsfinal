class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :mensaje_id
      t.text :texto
      t.timestamp :creacion_tweet
      t.text :recurso
      t.references :usuario
      t.references :busqueda
      t.references :localizacion
      t.timestamps
    end
  end
end
