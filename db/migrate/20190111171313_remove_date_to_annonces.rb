class RemoveDateToAnnonces < ActiveRecord::Migration[5.2]
  def change
    remove_column :annonces, :date
  end
end
