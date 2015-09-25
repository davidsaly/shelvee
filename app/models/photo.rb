class Photo < ActiveRecord::Base
	has_many :contributions
	has_many :users, :through => :contributions
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
end
