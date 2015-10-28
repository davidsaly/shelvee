class AddForeignKeyToSelection < ActiveRecord::Migration
  def change
    add_foreign_key :selections, :users, column: :owner_id
  end
end
