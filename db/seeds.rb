# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_1 = User.create(email: "test@test.com", password: "12345678")
prompt_1 = Prompt.create(text: "Luminara Unduli is at Felucia riding on a T-16 skyhopper heading towards a Calamari Cruiser filled with Wookiees", user_id: user_1.id)
