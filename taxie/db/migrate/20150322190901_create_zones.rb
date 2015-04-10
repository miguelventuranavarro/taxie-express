class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.references :district, index: true

      t.timestamps
    end
  end
end
