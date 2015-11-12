class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :recipient_email
      t.integer :recipient_id
      t.integer :sender_id
      t.integer :album_id
      t.string :token

      t.timestamps null: false
    end
  end
end
