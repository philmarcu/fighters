require 'rails_helper'

RSpec.describe 'moves show page' do
  it 'displays the specific moves name & stats' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    move = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    move2 = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)

    visit "/moves/#{move.id}"

    expect(page).to have_content(move.name)
    expect(page).to have_content(move.power)
    expect(page).to have_content(move.speed)
    expect(page).to have_content(fox.name)

    expect(page).to_not have_content(move2.name)
    expect(page).to_not have_content(move2.power)
    expect(page).to_not have_content(move2.speed)
    expect(page).to_not have_content(turtle.name)
  end
end