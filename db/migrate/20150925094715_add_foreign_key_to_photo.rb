class AddForeignKeyToPhoto < ActiveRecord::Migration
  def change
  	add_foreign_key :photos, :users, column: :owner_id
  end
end
