class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :contributions
  has_many :photos, :through => :contributions

  has_many :cooperations
  has_many :albums, :through => :cooperations

  has_many :albums, :foreign_key => :owner_id
  has_many :photos, :foreign_key => :owner_id
  has_many :selections, :foreign_key => :owner_id

  has_many :invites, :class_name => "Invitation", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invitation", :foreign_key => 'sender_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
