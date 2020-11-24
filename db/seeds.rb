# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Device.destroy_all
Category.destroy_all
Rental.destroy_all
User.destroy_all

c1 = Category.create!(name: "Raclette")
c2 = Category.create!(name: "Pierrade")
c3 = Category.create!(name: "Crêpe party")
c4 = Category.create!(name: "PopCorn party")

u1 = User.create!(email: "jasinski_caroline@yahoo.fr", password: "azertyazerty", first_name: "Caroline", last_name: "Jasinski", description: nil, address: "118 rue André Deplace 59830 Cysoing")
u2 = User.create!(email: "nicholas04claessens@yahoo.com", password: "azertyazerty", first_name: "Nicholas", last_name: "Claessens", description: nil, address: "1 rue Thier Saive 4608 Warsage")
u3 = User.create!(email: "chompum.aphisit@hotmail.fr", password: "azertyazerty", first_name: "Aphisit", last_name: "Chompum", description: nil, address: "163 rue Auber 59200 Tourcoing")

d1 = Device.new(name: "Raclette Caro", description: "LA plus belle des raclettes à votre table!", price: 500)
d1.user_id = u1.id
d1.category_id = c1.id
d1.save!
d2 = Device.new(name: "Pierrade de ouf de Nicho", description: "La meilleure viande grillée du monde", price: 400)
d2.user_id = u2.id
d2.category_id = c2.id
d2.save!
d3 = Device.new(name: "Crêpe de dingue d'Aphisit", description: "Votre meilleure crêpe!...surtout avec du Nutella!", price: 700.50)
d3.user_id = u3.id
d3.category_id = c3.id
d3.save!
d4 = Device.new(name: "PopCorn tous ensemble d'Aphisit", description: "Anti-covid, mangez des pop corn tous ensemble!!", price: 200)
d4.user_id = u3.id
d4.category_id = c4.id
d4.save!


# id: nil,
#  start_date: nil,
#  end_date: nil,
#  user_id: nil,
#  device_id: nil,
#  created_at: nil,
#  updated_at: nil,
#  state: "pending">

