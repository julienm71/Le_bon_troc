class AddConflitsToEchange < ActiveRecord::Migration[5.2]
  def change
    add_column :echanges, :conflit, :boolean, :default => false
    add_column :echanges, :raison_conflit, :string
    add_column :echanges, :status_conflit, :string, :default => 'aucun_conflit'
  end
end
