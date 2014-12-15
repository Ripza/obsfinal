class CreateComunas < ActiveRecord::Migration
  def change
    create_table :comunas do |t|
      t.text :comuna_nombre
	  t.references :provincium
	  
    end
  end
end
