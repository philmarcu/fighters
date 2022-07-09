class RemoveRangeFromMoves < ActiveRecord::Migration[5.2]
  def change
    remove_column :moves, :range, :integer
  end
end
