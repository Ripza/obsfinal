class CreateBusquedas < ActiveRecord::Migration
  def change
    create_table :busquedas do |t|
      t.text :palabra
      t.text :intension

      t.timestamps
    end
  end
end
