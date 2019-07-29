class Echange < ApplicationRecord
  has_many :users, dependent: :destroy
  mount_uploader :objetdemandeur_photo1, PhotoUploader
  mount_uploader :objetdemandeur_photo2, PhotoUploader
  mount_uploader :objetdemandeur_photo3, PhotoUploader
  validates :demandeur_id, :proprietaire_id, :annonce_id, :objetdemandeur_photo1, :typeechange, presence: true
end
