class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :power
      t.integer :speed
      t.string :grade
      t.boolean :top_tier
      t.timestamps
    end
  end
end
