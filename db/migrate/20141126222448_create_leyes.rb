class CreateLeyes < ActiveRecord::Migration
  def change
    create_table :leyes do |t|
      t.text :nombre
      t.text :tema

      t.timestamps
    end
  end
end
