require 'rails_helper'

RSpec.describe 'fighters movelist index page' do
  it 'displays all the moves a fighter has' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

    fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    fox_h = Move.create!(name: "Sweep (Heavy)", power: 57, speed: 62, grade: "69.5 - C Tier", top_tier: false, fighter_id: fox.id)
    fox_s = Move.create!(name: "Shadow Tailwhip (Special)", power: 83, speed: 58, grade: "80.5 - A Tier", top_tier: true, fighter_id: fox.id)
  end
end