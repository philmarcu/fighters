require 'rails_helper'

RSpec.describe 'Best Moves index page' do
  describe 'move index true records block' do
    # User Story 15, Child Index only shows `true` Records 
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    it 'links to best_moves index where top tier is true' do
      fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
      turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

      move1 = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
      move2 = turtle.moves.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
      top1 = fox.moves.create!(name: "SuperSlash (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)
      top2 = turtle.moves.create!(name: "Big Boom (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: turtle.id)
      
      visit "/moves/best_moves"

      save_and_open_page
      
      expect(page).to have_content(top1.name)
      expect(page).to have_content(top2.power)
      expect(page).to_not have_content(move1.name)
      expect(page).to_not have_content(move2.grade)
    end
  end
end