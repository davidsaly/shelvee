class Album < ActiveRecord::Base
	has_many :cooperations, dependent: :destroy
	has_many :users, :through => :cooperations

	has_many :belongings, dependent: :destroy
	has_many :photos, -> { uniq }, :through => :belongings, dependent: :destroy

	has_many :selections, dependent: :destroy
	
	accepts_nested_attributes_for :photos

	validates :title, presence: true

	belongs_to :owner, class_name: "User", foreign_key: "owner_id"

	has_many :invitations, dependent: :destroy
end
