class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :user, index: true
      t.references :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :contributions, :users
    add_foreign_key :contributions, :photos
  end
end
