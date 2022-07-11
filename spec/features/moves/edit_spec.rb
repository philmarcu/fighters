require 'rails_helper'
# As a visitor
# When I visit a Move Show page
# Then I see a link to update that Move "Update Move"
# When I click the link
# I am taken to '/move_table_name/:id/edit' where I see a form to edit the move's attributes:
# When I click the button to submit the form "Update Move"
# Then a `PATCH` request is sent to '/move_table_name/:id',
# the move's data is updated,
# and I am redirected to the Move Show page where I see the Move's updated information

RSpec.describe 'moves edit page' do
  describe 'when i see a moves show page' do
    it 'takes us to an edit form page for that move' do

      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
      
      fox_l = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      tur_h = turtle.moves.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
      
      visit "/moves/#{fox_l.id}"

      click_on "Update Move"

      save_and_open_page
      
      expect(current_path).to eq("/moves/#{fox_l.id}/edit")
    end
  end
end
