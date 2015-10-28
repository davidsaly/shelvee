class AddOwnerIdToSelection < ActiveRecord::Migration
  def change
    add_column :selections, :owner_id, :integer
  end
end
