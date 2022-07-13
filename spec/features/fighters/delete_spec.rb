require 'rails_helper'

RSpec.describe 'delete button on index page' do
  it 'can delete a fighter from the index page' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
    
    visit "/fighters"
        
    click_on("Delete Fox The Boxer", :match => :first)
    expect(current_path).to eq('/fighters')

    save_and_open_page

    expect(page).to_not have_content(fox.name)
    expect(page).to have_content(turtle.name)
  end
end