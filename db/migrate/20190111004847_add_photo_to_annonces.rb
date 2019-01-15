class AddPhotoToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :photo, :string
  end
end
