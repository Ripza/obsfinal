class CreateLocalizacions < ActiveRecord::Migration
  def change
    create_table :localizacions do |t|
      t.integer :localizacion_id
      t.text :comuna
      t.text :ciudad
      t.text :region
      t.text :pais

      t.timestamps
    end
  end
end
