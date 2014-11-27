class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.text :cuenta_id
      t.text :nombre
      t.text :nick
      t.text :descripcion
      t.timestamp :creacion_usuario
      t.integer :contador_seguidores
      t.timestamps
    end
  end
end
