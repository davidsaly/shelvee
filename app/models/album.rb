class Album < ActiveRecord::Base
	has_many :cooperations
	has_many :users, :through => :cooperations
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
end
