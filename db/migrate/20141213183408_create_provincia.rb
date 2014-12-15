class CreateProvincia < ActiveRecord::Migration
  def change
    create_table :provincia do |t|
      t.text :provincia_nombre
	  t.references :region
    end
  end
end
