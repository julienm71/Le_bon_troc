class AddPhoto23ToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :photo2, :string
    add_column :annonces, :photo3, :string
  end
end
