class CreateCooperations < ActiveRecord::Migration
  def change
    create_table :cooperations do |t|
      t.references :user, index: true
      t.references :album, index: true

      t.timestamps null: false
    end
    add_foreign_key :cooperations, :users
    add_foreign_key :cooperations, :albums
  end
end
