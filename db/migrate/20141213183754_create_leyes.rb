class CreateLeyes < ActiveRecord::Migration
  def change
    create_table :leyes do |t|
      t.text :leyes_nombre
      t.text :leyes_tema

    end
  end
end
