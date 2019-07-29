class CreateEchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :echanges do |t|
      t.integer :demandeur_id
      t.integer :proprietaire_id
      t.integer :annonce_id
      t.boolean :proprietaire_accept
      t.integer :typeechange
      t.string :objetdemandeur_photo1
      t.string :objetdemandeur_photo2
      t.string :objetdemandeur_photo3

      t.timestamps
    end
  end
end
