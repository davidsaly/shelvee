class Invitation < ActiveRecord::Base
	
	belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'
	belongs_to :album

	before_create :generate_token

	def generate_token
   		self.token = Digest::SHA1.hexdigest([self.album_id, Time.now, rand].join)
	end
end
