class Annonce < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  validates :titre, :description, :raison, :contre, :photo, presence: true
  # after_create :new_annonce_mail

  def new_annonce_mail
    @annonce_titre = titre
    @annonce_description = description
    @annonce_raison = raison
    @annonce_contre = contre
    @annonce_photo = photo
    @annonce_autrepropositions = autrepropositions
    NewAnnonceMailer.new_annonce_mail(self).deliver
  end
end
