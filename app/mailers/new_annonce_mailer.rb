class NewAnnonceMailer < ApplicationMailer
  def new_annonce_mail(annonce)
    user = annonce.user
    @annonce_titre = annonce.titre
    @annonce_description = annonce.description
    @annonce_raison = annonce.raison
    @annonce_contre = annonce.contre
    @annonce_photo = annonce.photo
    @annonce_autrepropositions = annonce.autrepropositions
    mail to: user.email, subject: "Votre nouvelle annonce sur LeBonTroc", from: "no-reply@lebontroc.fr"
  end
end
