class CreateLocalizacions < ActiveRecord::Migration
  def change
    create_table :localizacions do |t|
      t.text :latitud
      t.text :longitud
      t.text :lugar
      t.timestamps
    end
  end
end
