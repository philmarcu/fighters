class Fighter < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :rank
  validates_presence_of :style
  validates :rival, inclusion: [true, false]
  has_many :moves

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def total_moves
    self.moves.length
  end
end