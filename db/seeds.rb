Echange.destroy_all
Annonce.destroy_all
Message.destroy_all
Conversation.destroy_all
User.destroy_all

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
  pays: 'France',
  ville: 'Cluny',
  region: 'Bourgogne',
  cp: 71250,
  adresse: '14 Allée des mures',
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
  pays: 'France',
  ville: 'Cluny',
  region: 'Bourgogne',
  cp: 71250,
  adresse: '14 Allée des mures',
)
usertest.save!

annonceadmin = Annonce.new(
  titre: 'Iphone X',
  description: 'Iphone X en parfaite état.',
  raison: 'Je n\'aime pas les Iphone..',
  contre: 'Samsung S9',
  autrepropositions: false,
  status: 2,
  typeechange: 0,
  user: useradmin,
)
annonceadmin.remote_photo_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
annonceadmin.remote_photo2_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
annonceadmin.remote_photo3_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
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
annoncetest.remote_photo2_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
annoncetest.remote_photo3_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
annoncetest.save!

# echangetest = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 2,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'HTC One Plus 6T',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_en_attente',
#   conflit: false,
#   status_proprietaire: false,
#   status_demandeur:  false,
#   raison_conflit: '',
#   status_conflit: 'aucun_conflit'
# )
# echangetest.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest.save!

# echangetest2 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 2,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'Samsung S9',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_en_conflit',
#   conflit: true,
#   raison_conflit: '',
#   status_conflit: 'en_attente_de_traitement_admin_conflit'
# )
# echangetest2.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest2.save!

# echangetest3 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 2,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'Samsung S9',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_en_cours',
#   conflit: false,
#   raison_conflit: '',
#   status_conflit: ''
# )
# echangetest3.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest3.save!

# echangetest4 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 2,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'Samsung S9',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_refuser',
#   conflit: false,
#   raison_conflit: '',
#   status_conflit: ''
# )
# echangetest4.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest4.save!

# echangetest5 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 1,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'HTC One Plus 6T',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_annuler',
#   conflit: true,
#   raison_conflit: '',
#   status_conflit: 'aucun_conflit'
# )
# echangetest5.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest5.save!

# echangetest6 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 1,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'Samsung S9',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_en_conflit',
#   conflit: true,
#   raison_conflit: '',
#   status_conflit: 'en_attente_de_traitement_admin_conflit'
# )
# echangetest6.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest6.save!

# echangetest7 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 1,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'Samsung S9',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_en_cours',
#   conflit: false,
#   raison_conflit: '',
#   status_conflit: ''
# )
# echangetest7.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest7.save!

# echangetest8 = Echange.new(
#   demandeur_id: 1,
#   proprietaire_id: 1,
#   proprietaire_accept: false,
#   annonce_id: 1,
#   typeechange: 0,
#   objetdemandeur_titre: 'Samsung S9',
#   objetdemandeur_desc: 'Description objetdemandeur_desc',
#   status: 'echange_finit',
#   conflit: false,
#   raison_conflit: '',
#   status_conflit: ''
# )
# echangetest8.remote_objetdemandeur_photo1_url = "https://res.cloudinary.com/dbhchqzna/image/upload/v1547168438/iphone-xr-home.jpg"
# echangetest8.save!

puts "--> Annonces test created!"
puts "--> Echanges test created!"
puts "--> Test user created!"
puts "--> Admin user created!"
