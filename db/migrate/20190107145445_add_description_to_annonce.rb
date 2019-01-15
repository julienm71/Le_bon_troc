class AddDescriptionToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :description, :string
  end
end
