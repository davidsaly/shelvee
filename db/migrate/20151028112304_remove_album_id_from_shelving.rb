class RemoveAlbumIdFromShelving < ActiveRecord::Migration
  def change
  	remove_reference :shelvings, :album
  	#remove_column :shelvings, :album_id
  end
end
