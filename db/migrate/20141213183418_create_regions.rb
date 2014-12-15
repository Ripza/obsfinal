class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.text :region_nombre

    end
  end
end
