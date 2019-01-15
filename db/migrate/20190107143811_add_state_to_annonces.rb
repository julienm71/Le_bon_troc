class AddStateToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :status, :integer
  end
end
