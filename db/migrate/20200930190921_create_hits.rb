class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :method
      t.integer :count
      t.string :origin
      t.string :payload

      t.timestamps null: false
    end
  end
end
