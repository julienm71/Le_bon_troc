class AddTypesEchangeToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :remisemainpropre, :boolean
    add_column :annonces, :envoievoiepostal, :boolean
  end
end
