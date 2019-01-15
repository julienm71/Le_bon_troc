class CreateAnnonces < ActiveRecord::Migration[5.2]
  def change
    create_table :annonces do |t|
      t.string :titre
      t.string :contre
      t.references :user
      t.date :date

      t.timestamps
    end
  end
end
