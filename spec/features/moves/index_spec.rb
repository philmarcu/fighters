require 'rails_helper'

RSpec.describe 'moves index page' do
  describe 'index and moveslist tests' do
    it 'displays all the moves in the game' do
      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
      mailman = Fighter.create!(name: "The Mailman", rival: "true", rank: 4, style: "Backyard Brawling")

      fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      tur_h = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
      mail_h = Move.create!(name: "Dolly Smash (Heavy)", power: 77, speed: 54, grade: "76.5 - B Tier", top_tier: false, fighter_id: mailman.id)

      visit "/moves"

      expect(page).to have_content(fox_l.name)
      expect(page).to have_content(tur_h.grade)
      expect(page).to have_content(mail_h.power)
    end

    it 'links to the moveslist & fighter page' do
      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

      move1 = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      move2 = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)


      visit "/fighters"

      click_on "Moveslist"

      expect(page).to have_content(move1.name)
      expect(page).to have_content(move2.name)
      expect(page).to_not have_content(fox.rank)
      expect(page).to_not have_content(turtle.rank)
    end

    it 'links to a specific fighter`s edit page' do
      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      
      move1 = fox.moves.create!(name: "Double Dive (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)
      move2 = fox.moves.create!(name: "Grazer-blast (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: fox.id)

      visit "/moves"
  
      click_link("Double Dive (Special)", :match => :first)
      
      expect(current_path).to eq("/moves/#{move1.id}/edit")
      expect(current_path).to_not eq("/moves/#{move2.id}/edit")
      expect(page).to have_button("Update Your Move")
    end
  end
end


