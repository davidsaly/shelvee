class Album < ActiveRecord::Base
	has_many :cooperations
	has_many :users, :through => :cooperations

	has_many :belongings
	has_many :photos, :through => :belongings
	
	accepts_nested_attributes_for :photos

	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
end
