class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.text :nombre
      t.text :fecha

      t.timestamps
    end
  end
end
