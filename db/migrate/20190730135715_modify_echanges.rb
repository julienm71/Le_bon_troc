class ModifyEchanges < ActiveRecord::Migration[5.2]
  def change
    change_column :echanges, :status, :string, :default => 'en_attente'
  end
end
