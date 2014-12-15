class CreateBusquedas < ActiveRecord::Migration
  def change
    create_table :busquedas do |t|
      t.text :palabra
      t.text :intension
      t.references :evento
      t.references :leye
      t.references :iniciativa
    end
  end
end
