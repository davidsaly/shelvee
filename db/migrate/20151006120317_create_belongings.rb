class CreateBelongings < ActiveRecord::Migration
  def change
    create_table :belongings do |t|
      t.references :album, index: true
      t.references :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :belongings, :albums
    add_foreign_key :belongings, :photos
  end
end
