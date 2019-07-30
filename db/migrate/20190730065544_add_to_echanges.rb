class AddToEchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :echanges, :objetdemandeur_titre, :string
  end
end
