# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(name:"Dog House")
Item.create(name:"Cat Blanket")
Item.create(name:"Frog Onesie")

Image.create(file_name:"dh_1_m.jpg", item_id:1)
Image.create(file_name:"dh_2.jpg", item_id:1)
Image.create(file_name:"cb_1_m.jpg", item_id:2)
Image.create(file_name:"cb_2_m.jpg", item_id:2)
Image.create(file_name:"cb_3.jpg", item_id:2)
Image.create(file_name:"fo_1_m.jpg", item_id:3)
