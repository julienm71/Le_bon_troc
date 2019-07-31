class AddObjetdemandeurDescToEachanges < ActiveRecord::Migration[5.2]
  def change
    add_column :echanges, :objetdemandeur_desc, :string, :default => ''
  end
end
