class AddSatusdpToEchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :echanges, :status_proprietaire, :boolean, :default => false
    add_column :echanges, :status_demandeur, :boolean, :default => false
  end
end
