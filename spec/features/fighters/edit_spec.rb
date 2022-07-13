require 'rails_helper'

RSpec.describe 'fighter edit page' do
  describe 'when I see a fighters show page' do
    it 'takes us to an edit form for that fighter' do

      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

      visit "/fighters/#{fox.id}"

      click_on "Edit Fighter"

      expect(current_path).to eq("/fighters/#{fox.id}/edit")
    end

    it 'updates the data and returns to the show page' do
      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

      visit "/fighters/#{fox.id}"

      click_on "Edit Fighter"

      fill_in("Name", with: "Chip The Hippo")
      fill_in("Rival", with: false)
      fill_in("Rank", with: 10)
      fill_in("Style", with: "Sumo")

      click_button("Edit Your Fighter")

      expect(current_path).to eq("/fighters/#{fox.id}")
      expect(page).to have_content("Chip The Hippo")
    end
  end
end