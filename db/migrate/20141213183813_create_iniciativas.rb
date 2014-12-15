class CreateIniciativas < ActiveRecord::Migration
  def change
    create_table :iniciativas do |t|
      t.text :iniciativa_nombre
      t.text :iniciativa_tema

    end
  end
end
