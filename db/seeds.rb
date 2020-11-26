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

u1 = User.new(email: "jasinski_caroline@yahoo.fr", password: "azertyazerty", first_name: "Caroline", last_name: "Jasinski", description: nil, address: "Cysoing", phone_number: "0610111213")
file = URI.open('https://avatars3.githubusercontent.com/u/68743949?s=460&u=f16cbc21758c842fba66a642775e7c931a7be251&v=4')
u1.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u1.save!

u2 = User.new(email: "nicholas04claessens@yahoo.com", password: "azertyazerty", first_name: "Nicholas", last_name: "Claessens", description: nil, address: "Warsage", phone_number: "0611223344")
file = URI.open('https://avatars1.githubusercontent.com/u/70324228?s=400&u=4b7e428200c39fee27f4d7ab4956100519065772&v=4')
u2.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u2.save!

u3 = User.create!(email: "chompum.aphisit@hotmail.fr", password: "azertyazerty", first_name: "Aphisit", last_name: "Chompum", description: nil, address: "163 rue Auber 59200 Tourcoing", phone_number: "0722889977")
file = URI.open('https://avatars2.githubusercontent.com/u/72460013?s=460&u=f69a8626581d6fbdad07e47bc67a630b6b8aae3a&v=4')
u3.photo.attach(io: file, filename: 'caro.jpg', content_type: 'image/jpg')
u3.save!

puts "#{User.count} users created"

d1 = Device.new(name: "Raclette Caro", description: "LA plus belle des raclettes à votre table pour déguster le meilleur fromage du monde en mode traditionnel!", price: 500)
d1.user_id = u1.id
d1.category_id = c1.id
file = URI.open('https://www.alpha-evenement.fr/608-large_default/appareil-a-raclette-electrique-25.jpg')
d1.photo.attach(io: file, filename: 'd1.jpg', content_type: 'image/jpg')
d1.save!

d2 = Device.new(name: "Pierrade de ouf de Nicho", description: "Cette pierrade cuit avec chaleur et tendresse vos viandes, poissons et même les légumes!", price: 400)
d2.user_id = u2.id
d2.category_id = c2.id
file = URI.open('https://img.cuisineaz.com/680x357/2017-06-11/i128169-.jpeg')
d2.photo.attach(io: file, filename: 'd2.jpeg', content_type: 'image/jpeg')
d2.save!

d3 = Device.new(name: "Crêpe de dingue d'Aphisit", description: "Cette crêpe party réalise vos meilleures crêpes!...surtout avec du Nutella!", price: 700.50)
d3.user_id = u3.id
d3.category_id = c3.id
file = URI.open('http://www.leboucestgarni.fr/assets/img/tefal-crep-party-utilisation_c64e13bd2197d408d169f4865fb946da.jpg')
d3.photo.attach(io: file, filename: 'd3.jpg', content_type: 'image/jpg')
d3.save!

d4 = Device.new(name: "PopCorn tous ensemble d'Aphisit", description: "Anti-covid, mangez des pop corn tous ensemble!! Viva la pop'fiesta!! ", price: 200)
d4.user_id = u3.id
d4.category_id = c4.id
file = URI.open('https://www.lavantgardiste.com/19147-large_default/machine-a-pop-corn-deluxe.jpg')
d4.photo.attach(io: file, filename: 'd4.jpg', content_type: 'image/jpg')
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

