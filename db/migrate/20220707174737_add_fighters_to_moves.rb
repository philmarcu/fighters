class AddFightersToMoves < ActiveRecord::Migration[5.2]
  def change
    add_reference :moves, :fighter, foreign_key: true
  end
end
