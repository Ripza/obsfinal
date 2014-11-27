class CreateLocalizacions < ActiveRecord::Migration
  def change
    create_table :localizacions do |t|
      t.text :comuna
      t.text :provincia
      t.text :region

      t.timestamps
    end
  end
end
