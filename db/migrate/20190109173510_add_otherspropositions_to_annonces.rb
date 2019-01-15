class AddOtherspropositionsToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :autrepropositions, :boolean
  end
end
