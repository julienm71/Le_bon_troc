# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Annonce.destroy_all

puts "--> Database erased."
puts "--> Database reconstruction in progress..."

useradmin = User.new(
  pseudo: 'Admin',
  first_name: 'Julien',
  last_name: 'Martin',
  email: 'admin@test.fr',
  password: 'test123',
  phone: '0651763648',
  admin: true,
)
useradmin.save!

usertest = User.new(
  pseudo: 'UserTest',
  first_name: 'User',
  last_name: 'Test',
  email: 'user@test.fr',
  password: 'test123',
  phone: '0651763648',
  admin: false,
)
usertest.save!

annonceadmin = Annonce.new(
  titre: 'Iphone X',
  description: 'Iphone X en parfaite état.',
  raison: 'Je n\'aime pas les Iphone..',
  contre: 'Samsung S9',
  autrepropositions: true,
  status: 2,
  typeechange: 0,
  user: useradmin,
)
annonceadmin.remote_photo_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
annonceadmin.save!

annoncetest = Annonce.new(
  titre: 'Iphone 7',
  description: 'Iphone 7 en parfaite état.',
  raison: 'Je n\'aime pas les Iphone..',
  contre: 'HTC One plus 6T',
  autrepropositions: true,
  status: 2,
  typeechange: 2,
  user: usertest,
)
annoncetest.remote_photo_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
annoncetest.save!

puts "--> Annonce test created!"
puts "--> Admin user created!"
