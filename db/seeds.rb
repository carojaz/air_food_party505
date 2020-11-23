# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create!(email: "jasinski_caroline@yahoo.fr", password: "azertyazerty", first_name: "Caroline", last_name: "Jasinski", description: nil, address: "118 rue André Deplace 59830 Cysoing")
User.create!(email: "nicholas04claessens@yahoo.com", password: "azertyazerty", first_name: "Nicholas", last_name: "Claessens", description: nil, address: "1 rue Thier Saive 4608 Warsage")
User.create!(email: "chompum.aphisit@hotmail.fr", password: "azertyazerty", first_name: "Aphisit", last_name: "Chompum", description: nil, address: "163 rue Auber 59200 Tourcoing")
