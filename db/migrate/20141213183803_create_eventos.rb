class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.text :evento_nombre
      t.text :fecha

    end
  end
end
