require 'rails_helper'

RSpec.describe Move, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :power }
    it { should validate_presence_of :speed }
    it { should validate_presence_of :grade }
    it { should allow_value(true).for(:top_tier)}
    it { should allow_value(false).for(:top_tier)}
  end

  describe 'relationships' do
    it { should belong_to :fighter}
  end

  describe 'top tier' do
    it 'goes to the top tier page' do
      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

      move = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      move2 = turtle.moves.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
      top1 = fox.moves.create!(name: "SuperSlash (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)
      top2 = turtle.moves.create!(name: "Big Boom (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: turtle.id)
      
      expect(move.order_by_top_tier).to eq([top1, top2])
    end
  end
end