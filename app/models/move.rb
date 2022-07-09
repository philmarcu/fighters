class Move < ApplicationRecord
  validates_presence_of :name 
  validates_presence_of :power
  validates_presence_of :speed
  validates_presence_of :grade
  validates :top_tier, inclusion: [true, false]
  belongs_to :fighter
end