class AddTypeEchangeToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :typeechange, :integer
  end
end
