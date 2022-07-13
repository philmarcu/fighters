require 'rails_helper'

RSpec.describe 'moves edit page' do
  describe 'when i see a moves show page' do
    it 'takes us to an edit form page for that move' do

      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
      
      fox_l = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      tur_h = turtle.moves.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
      
      visit "/moves/#{fox_l.id}"

      click_on "Update Move"
      
      expect(current_path).to eq("/moves/#{fox_l.id}/edit")
      expect(current_path).to_not eq("/moves/#{tur_h.id}/edit")
    end
  end

  describe 'when i click Update Move in moves edit page' do
    it 'updates the data and returns to the show page' do

      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
      
      fox_l = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      tur_h = turtle.moves.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)

      visit "/moves/#{fox_l.id}/edit"

      
      fill_in("Name", with: "Slash (Light)")
      fill_in("Power", with: 41)
      fill_in("Speed", with: 93)
      fill_in("Grade", with: "222.2 - G Tier (Edit)")
      fill_in("Top tier", with: "222.2 - G Tier (Edit)")

      
      click_on("Update Your Move")
      
      expect(current_path).to eq("/moves/#{fox_l.id}")
      expect(page).to have_content("222.2 - G Tier (Edit)")
      expect(page).to_not have_content("77.0 - B Tier")
    end
  end
end
