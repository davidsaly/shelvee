class RemoveAlbumFromShelving < ActiveRecord::Migration
  def change
  	remove_reference :shelvings, :album
  end
end
