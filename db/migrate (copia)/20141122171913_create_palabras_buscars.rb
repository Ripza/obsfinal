class CreatePalabrasBuscars < ActiveRecord::Migration
  def change
    create_table :palabras_buscars do |t|
      t.text :palabras_buscar_id
      t.text :palabra

      t.timestamps
    end
  end
end
