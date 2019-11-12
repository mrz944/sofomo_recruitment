class CreateGeolocations < ActiveRecord::Migration[6.0]
  def change
    create_table :geolocations do |t|
      t.string :ip
      t.string :name, unique: true
      t.decimal :latitude, { precision: 10, scale: 6 }
      t.decimal :longitude, { precision: 10, scale: 6 }

      t.timestamps
    end
    add_index :geolocations, :name
  end
end
