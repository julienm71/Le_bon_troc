class Echange < ApplicationRecord
  attr_accessor :user_echange_demandeur
  attr_accessor :user_echange
  attr_accessor :user_echange_annonce
  # has_many :users, dependent: :destroy
  mount_uploader :objetdemandeur_photo1, PhotoUploader
  mount_uploader :objetdemandeur_photo2, PhotoUploader
  mount_uploader :objetdemandeur_photo3, PhotoUploader
  validates :demandeur_id,
            :proprietaire_id,
            :annonce_id,
            :typeechange,
            :objetdemandeur_photo1,
            :objetdemandeur_titre,
            :objetdemandeur_desc,
            presence: true
end
