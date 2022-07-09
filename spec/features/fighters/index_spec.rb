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

    within "#fighter-0" do
      expect(page).to  have_content("Fox The Boxer")
      expect(page).to_not have_content("The Tilted Turtle")
    end
  
    within "#fighter-1" do
      expect(page).to have_content("The Tilted Turtle")
      expect(page).to_not  have_content("Fox The Boxer")
    end
  
    within '#fighter-2' do
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

  it 'orders by when fighter is created' do
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
end