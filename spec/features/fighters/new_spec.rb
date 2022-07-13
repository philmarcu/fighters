require 'rails_helper'

RSpec.describe 'fighter new page' do
  it 'can visit page for creating new fighter' do

    visit '/fighters'

    click_on 'Create-A-Fighter'

    fill_in("Name", with: "Chip The Hippo")
    fill_in("Rival", with: false)
    fill_in("Rank", with: 10)
    fill_in("Style", with: "Sumo")

    click_on("Create Your Fighter")

    expect(current_path).to eq("/fighters")
    expect(page).to have_content("Chip The Hippo")
    expect(page).to have_content("Sumo")
  end
end