class AddStatusToEchange < ActiveRecord::Migration[5.2]
  def change
    add_column :echanges, :status, :string, :default => 'en cours'
    change_column :echanges, :proprietaire_accept, :boolean, :default => false
    change_column :echanges, :typeechange, :integer, :default => 0
    change_column :echanges, :objetdemandeur_photo2, :string, :default => 'none'
    change_column :echanges, :objetdemandeur_photo3, :string, :default => 'none'
  end
end
