class CreateFavoriteAddresses < ActiveRecord::Migration
  def change
    create_table :favorite_addresses do |t|
      t.string :name
      t.string :address
      t.string :ref
      t.references :district, index: true
      t.references :zone, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
