require 'rails_helper'

RSpec.describe 'fighters movelist index page' do
  it 'displays all the moves a fighter has' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

    fox_l = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    fox_h = fox.moves.create!(name: "Sweep (Heavy)", power: 57, speed: 62, grade: "69.5 - C Tier", top_tier: false, fighter_id: fox.id)
    fox_s = fox.moves.create!(name: "Shadow Tailwhip (Special)", power: 83, speed: 58, grade: "80.5 - A Tier", top_tier: true, fighter_id: fox.id)

    visit "/fighters"

    click_on "Moveslist"

    expect(page).to have_content(fox_l.name)
    expect(page).to have_content(fox_h.name)
    expect(page).to have_content(fox_s.name)
  end

  it 'links to the moveslist & fighter page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    fox_l = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    tur_h = turtle.moves.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)


    visit "/fighters"

    click_on "Moveslist"

    expect(page).to have_content(fox_l.name)
    expect(page).to have_content(tur_h.name)
    expect(page).to_not have_content(fox.rank)
    expect(page).to_not have_content(turtle.rank)
  end

  it 'links to moves a fighter has from a fighters show page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")

    fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    fox_h = Move.create!(name: "Sweep (Heavy)", power: 57, speed: 62, grade: "69.5 - C Tier", top_tier: false, fighter_id: fox.id)
    fox_s = Move.create!(name: "Shadow Tailwhip (Special)", power: 83, speed: 58, grade: "80.5 - A Tier", top_tier: true, fighter_id: fox.id)
    tur_h = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)

    visit "/fighters/#{fox.id}"

    click_on fox.name

    expect(page).to have_content(fox_l.name)
    expect(page).to have_content(fox_h.power)
    expect(page).to have_content(fox_s.speed)
    expect(page).to_not have_content(tur_h.name)
  end

  it 'links to sorted alphabetical list of a fighter`s moves' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

    move1 = fox.moves.create!(name: "Double Dive (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)
    move2 = fox.moves.create!(name: "Grazer-blast (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: fox.id)
    move3 = fox.moves.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    move4 = fox.moves.create!(name: "Zorro's Slash (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)

    visit "/fighters/#{fox.id}/moves"

    click_link "Sort Alphabetically"

    expect(current_path).to eq("/fighters/#{fox.id}/moves")
    expect(move1.name).to appear_before(move2.name)
    expect(move2.name).to appear_before(move3.name)
    expect(move3.name).to appear_before(move4.name)
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

  it 'links to a fighter moves delete and returns to the index page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")

    move1 = fox.moves.create!(name: "Double Dive (Special)", power: 99, speed: 99, grade: "99.9 - S Tier", top_tier: true, fighter_id: fox.id)
    move2 = fox.moves.create!(name: "Grazer-blast (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: fox.id)
   
    visit "/fighters/#{fox.id}/moves"

    click_on("Delete Grazer-blast (Heavy)", :match => :first)

    expect(current_path).to eq("/moves")
    expect(page).to have_content(move1.name)
    expect(page).to_not have_content(move2.name)
  end
end