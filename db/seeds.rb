# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

Device.destroy_all
Category.destroy_all
Rental.destroy_all
User.destroy_all

c1 = Category.create!(name: "Raclette")
c2 = Category.create!(name: "Pierrade")
c3 = Category.create!(name: "Crêpe party")
c4 = Category.create!(name: "PopCorn party")

puts "#{Category.count} categories created"

u1 = User.create!(email: "jasinski_caroline@yahoo.fr", password: "azertyazerty", first_name: "Caroline", last_name: "Jasinski", description: nil, address: "118 rue André Deplace 59830 Cysoing")
u2 = User.create!(email: "nicholas04claessens@yahoo.com", password: "azertyazerty", first_name: "Nicholas", last_name: "Claessens", description: nil, address: "1 rue Thier Saive 4608 Warsage")
u3 = User.create!(email: "chompum.aphisit@hotmail.fr", password: "azertyazerty", first_name: "Aphisit", last_name: "Chompum", description: nil, address: "163 rue Auber 59200 Tourcoing")

puts "#{User.count} users created"

d1 = Device.new(name: "Raclette Caro", description: "LA plus belle des raclettes à votre table!", price: 500)
d1.user_id = u1.id
d1.category_id = c1.id
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
d1.photo.attach(io: file, filename: 'u1.png', content_type: 'image/png')
d1.save!

d2 = Device.new(name: "Pierrade de ouf de Nicho", description: "La meilleure viande grillée du monde", price: 400)
d2.user_id = u2.id
d2.category_id = c2.id
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
d2.photo.attach(io: file, filename: 'u1.png', content_type: 'image/png')
d2.save!

d3 = Device.new(name: "Crêpe de dingue d'Aphisit", description: "Votre meilleure crêpe!...surtout avec du Nutella!", price: 700.50)
d3.user_id = u3.id
d3.category_id = c3.id
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
d3.photo.attach(io: file, filename: 'u1.png', content_type: 'image/png')
d3.save!

d4 = Device.new(name: "PopCorn tous ensemble d'Aphisit", description: "Anti-covid, mangez des pop corn tous ensemble!!", price: 200)
d4.user_id = u3.id
d4.category_id = c4.id
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
d4.photo.attach(io: file, filename: 'u1.png', content_type: 'image/png')
d4.save!

puts "#{Device.count} devices created"

r1 = Rental.new(start_date: "2020-11-24", end_date: "2020-11-27", user_id: u1.id, device_id: d2.id)
r1.save!
r2 = Rental.new(start_date: "2020-11-13", end_date: "2020-11-14", user_id: u1.id, device_id: d3.id)
r2.save!
r3 = Rental.new(start_date: "2020-12-09", end_date: "2020-12-10", user_id: u2.id, device_id: d1.id)
r3.save!
r4 = Rental.new(start_date: "2020-12-03", end_date: "2020-12-04", user_id: u2.id, device_id: d4.id)
r4.save!
r5 = Rental.new(start_date: "2020-12-01", end_date: "2020-12-02", user_id: u3.id, device_id: d1.id)
r5.save!
r6 = Rental.new(start_date: "2020-12-25", end_date: "2020-12-26", user_id: u3.id, device_id: d2.id)
r6.save!

puts "#{Rental.count} rentals created"


#<Rental id: 2, start_date: "2020-11-24", end_date: "2020-11-27", user_id: 4, device_id: 7, created_at: "2020-11-24 17:27:29", updated_at: "2020-11-24 17:27:29", state: "pending">]>

# id: nil,
#  start_date: nil,
#  end_date: nil,
#  user_id: nil,
#  device_id: nil,
#  created_at: nil,
#  updated_at: nil,
#  state: "pending">

