require 'rails_helper'

RSpec.describe 'fighters show page' do
  it 'displays the fighters name' do
    fighter = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    fighter2 = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    visit "/fighters/#{fighter.id}"

    expect(page).to have_content(fighter.name)
    expect(page).to_not have_content(fighter2.name)
  end

  it 'displays the fighters other stats' do
    fighter = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    fighter2 = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    visit "/fighters/#{fighter.id}"

    expect(page).to have_content(fighter.rival)
    expect(page).to have_content(fighter.rank)
    expect(page).to have_content(fighter.style)
    expect(page).to_not have_content(fighter2.rival)
  end
end