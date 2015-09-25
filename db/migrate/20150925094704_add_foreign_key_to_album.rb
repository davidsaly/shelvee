class AddForeignKeyToAlbum < ActiveRecord::Migration
  def change
  	add_foreign_key :albums, :users, column: :owner_id
  end
end
