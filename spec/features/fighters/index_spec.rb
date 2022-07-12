require 'rails_helper'

RSpec.describe 'Fighters index page' do

  it 'displays all fighters in the game' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 2, style: "Ninjutsu")
    mailman = Fighter.create!(name: "The Mailman", rival: "true", rank: 4, style: "Backyard Wrestling")

    visit "/fighters"

    expect(page).to have_content(fox.name)
    expect(page).to have_content(turtle.name)
    expect(page).to have_content(mailman.name)

    within "#fighter-2" do
      expect(page).to  have_content("Fox The Boxer")
      expect(page).to_not have_content("The Tilted Turtle")
    end
  
    within "#fighter-1" do
      expect(page).to have_content("The Tilted Turtle")
      expect(page).to_not  have_content("Fox The Boxer")
    end
  
    within '#fighter-0' do
      expect(page).to have_content("The Mailman")
      expect(page).to_not have_content("The Tilted Turtle")
    end
  end

  it 'displays the created date of the fighter' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 2, style: "Ninjutsu")

    visit "/fighters"

    expect(page).to have_content(fox.created_at)
    expect(page).to have_content(turtle.created_at)
  end

  it 'orders by when fighter is created(descending)' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 2, style: "Ninjutsu")
    mailman = Fighter.create!(name: "The Mailman", rival: "true", rank: 4, style: "Backyard Wrestling")

    visit "/fighters"

    within "#fighter-0" do
      expect(page).to have_content(mailman.name)
    end

    within "#fighter-1" do
      expect(page).to have_content(turtle.name)
    end

    within "#fighter-2" do
      expect(page).to have_content(fox.name)
    end
  end

  it 'links to the moveslist & fighter page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    tur_h = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)


    visit "/fighters"

    click_on "Moveslist"

    expect(page).to have_content(fox_l.name)
    expect(page).to have_content(tur_h.name)
    expect(page).to_not have_content(fox.rank)
    expect(page).to_not have_content(turtle.rank)
  end
end