class CreatePalabraClaves < ActiveRecord::Migration
  def change
    create_table :palabra_claves do |t|
      t.text :palabra
      t.boolean :intension

      t.timestamps
    end
  end
end
