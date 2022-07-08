# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Move.destroy_all
Fighter.destroy_all

# ------- Fighters(P) -------- #

fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
mailman = Fighter.create!(name: "The Mailman", rival: "true", rank: 4, style: "Backyard Brawling")
tubeman = Fighter.create!(name: "Inflatable Tube Man", rival: "false", rank: 1, style: "Wobbly")
king = Fighter.create!(name: "King", rival: "false", rank: 2, style: "Freestyle Wrestling")

# ------- Moves(C) -------- #

fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
fox_h = Move.create!(name: "Sweep (Heavy)", power: 57, speed: 62, grade: "69.5 - C Tier", top_tier: false, fighter_id: fox.id)
fox_s = Move.create!(name: "Shadow Tailwhip (Special)", power: 83, speed: 58, grade: "80.5 - A Tier", top_tier: true, fighter_id: fox.id)

tur_l = Move.create!(name: "Swipe (Light)", power: 52, speed: 65, grade: "68.5 - C Tier", top_tier: false, fighter_id: turtle.id)
tur_h = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
tur_s = Move.create!(name: "Shell Bomb (Special)", power: 96, speed: 54, grade: "85.0 - A Tier", top_tier: true, fighter_id: turtle.id)

mail_l = Move.create!(name: "Stamp (Light)", power: 63, speed: 60, grade: "71.5 - B Tier", top_tier: false, fighter_id: mailman.id)
mail_h = Move.create!(name: "Dolly Smash (Heavy)", power: 77, speed: 54, grade: "76.5 - B Tier", top_tier: false, fighter_id: mailman.id)
mail_s = Move.create!(name: "Mail Hail (Special)", power: 43, speed: 72, grade: "67.5 - C Tier", top_tier: false, fighter_id: mailman.id)

tube_l = Move.create!(name: "Noodle (Light)", power: 34, speed: 107, grade: "80.5 - A Tier", top_tier: true, fighter_id: tubeman.id)
tube_h = Move.create!(name: "Wave (Heavy)", power: 38, speed: 67, grade: "62.5 - C Tier", top_tier: false, fighter_id: tubeman.id)
tube_s = Move.create!(name: "Whirlwind (Special)", power: 50, speed: 97, grade: "83.5 - A Tier", top_tier: true, fighter_id: tubeman.id)

king_l = Move.create!(name: "Jab (Light)", power: 56, speed: 63, grade: "69.5 - C Tier", top_tier: false, fighter_id: king.id)
king_h = Move.create!(name: "Hellbow (Heavy)", power: 71, speed: 46, grade: "68.5 - C Tier", top_tier: false, fighter_id: king.id)
king_s = Move.create!(name: "Giant Swing (Special)", power: 102, speed: 47, grade: "84.5 - A Tier", top_tier: true, fighter_id: king.id)

