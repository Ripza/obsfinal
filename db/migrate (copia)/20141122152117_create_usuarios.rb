class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.integer :id
      t.text :nombre
      t.text :nick
      t.text :descripcion
      t.timestamps :creacion_usuario
      t.text :lenguaje_usuario
      t.text :cuenta_verificada
      t.integer :contador_seguidores

      t.timestamps
    end
  end
end
