require 'rails_helper'

RSpec.describe 'delete button on show page' do
  it 'can delete a move from the index page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    move1 = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    move2 = fox.moves.create!(name: "Grazer-blast (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: fox.id)

    
    visit "/moves/#{move1.id}"
        
    click_on("Delete Slash (Light)", :match => :first)

    expect(current_path).to eq('/moves')

    expect(page).to_not have_content(move1.name)
    expect(page).to have_content(move2.name)
  end
end