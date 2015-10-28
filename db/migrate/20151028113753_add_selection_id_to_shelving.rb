class AddSelectionIdToShelving < ActiveRecord::Migration
  def change
    add_reference :shelvings, :selection, index: true
    add_foreign_key :shelvings, :selections
  end
end
