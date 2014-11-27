class CreateIniciativas < ActiveRecord::Migration
  def change
    create_table :iniciativas do |t|
      t.text :nombre
      t.text :tema

      t.timestamps
    end
  end
end
