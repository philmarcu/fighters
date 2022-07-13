require 'rails_helper'

RSpec.describe Fighter do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:rival)}
    it { should allow_value(false).for(:rival)}
    it { should validate_presence_of :rank }
    it { should validate_presence_of :style }
  end

  describe 'relationships' do
    it { should have_many :moves }
  end

  describe 'class methods' do
    describe '#total_moves' do
      it 'should count a fighters total moves' do
        fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

        move1 = fox.moves.create!(name: "Double Dive (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)
        move2 = fox.moves.create!(name: "Grazer-blast (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: fox.id)

        expect(fox.total_moves).to eq(2)
      end
    end
  end
end