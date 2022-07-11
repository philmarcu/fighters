require 'rails_helper'

RSpec.describe 'fighter moves new page' do
  it 'can make a new move' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    move = Move.create!(name: "Sleek Overdrive (Special)", power: 79, speed: 58, grade: "85.3 - A Tier", top_tier: true, fighter_id: fox.id)
  end

  it 'can create a new move' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    move = Move.create!(name: "Sleek Overdrive (Special)", power: 79, speed: 58, grade: "85.3 - A Tier", top_tier: true, fighter_id: fox.id)

    visit "fighters/#{fox.id}/"

    click_link "Create Moves"
    fill_in('Name', with: "HyperFlash")
    fill_in('Power', with: 99)
    fill_in('Speed', with: 99)
    fill_in('Grade', with: '99.9 - S Tier')
    fill_in('Top Tier', with: true)
    click_on('Create New Move')

    save_and_open_page

    expect(page).to have_content(move.name)
  end
end