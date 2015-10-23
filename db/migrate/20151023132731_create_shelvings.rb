class CreateShelvings < ActiveRecord::Migration
  def change
    create_table :shelvings do |t|
      t.references :album, index: true
      t.references :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :shelvings, :albums
    add_foreign_key :shelvings, :photos
  end
end
