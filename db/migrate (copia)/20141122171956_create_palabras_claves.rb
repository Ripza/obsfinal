class CreatePalabrasClaves < ActiveRecord::Migration
  def change
    create_table :palabras_claves do |t|
      t.text :palabra
      t.boolean :intension

      t.timestamps
    end
  end
end
