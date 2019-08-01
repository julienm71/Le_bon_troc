class Echange < ApplicationRecord
  attr_accessor :user_echange_demandeur
  attr_accessor :user_echange
  attr_accessor :user_echange_annonce
  # belongs_to :demandeur, :foreign_key => :demandeur_id, class_name: 'User'
  # belongs_to :proprietaire, :foreign_key => :proprietaire_id, class_name: 'User'
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
