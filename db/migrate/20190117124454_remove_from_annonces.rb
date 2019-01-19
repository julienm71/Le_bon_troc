class RemoveFromAnnonces < ActiveRecord::Migration[5.2]
  def change
    remove_column :annonces, :remisemainpropre
    remove_column :annonces, :envoievoiepostal
  end
end
