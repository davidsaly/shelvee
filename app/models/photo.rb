class Photo < ActiveRecord::Base
	has_many :contributions
	has_many :users, :through => :contributions

	has_many :belongings, dependent: :destroy
	has_many :albums, -> { uniq }, :through => :belongings

	has_many :shelvings
	has_many :selections, :through => :shelvings

	accepts_nested_attributes_for :albums
	
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
	mount_uploader :picture, PictureUploader
end
