class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :album, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :selections, :albums
  end
end
