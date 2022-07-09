require 'rails_helper'

RSpec.describe 'fighters movelist index page' do
  it 'displays all the moves a fighter has' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

    fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    fox_h = Move.create!(name: "Sweep (Heavy)", power: 57, speed: 62, grade: "69.5 - C Tier", top_tier: false, fighter_id: fox.id)
    fox_s = Move.create!(name: "Shadow Tailwhip (Special)", power: 83, speed: 58, grade: "80.5 - A Tier", top_tier: true, fighter_id: fox.id)
  end

  it 'links to the moveslist & fighter page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    tur_h = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)


    visit "/fighters"

    click_on "Moveslist"

    expect(page).to have_content(fox_l.name)
    expect(page).to have_content(tur_h.name)
    expect(page).to_not have_content(fox.rank)
    expect(page).to_not have_content(turtle.rank)
  end
end