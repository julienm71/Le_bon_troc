class AddCountryInfosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ville, :string
    add_column :users, :cp, :integer
    add_column :users, :pays, :string
    add_column :users, :adresse, :string
  end
end
