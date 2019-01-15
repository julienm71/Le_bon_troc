class AddRaisonToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :raison, :string
  end
end
