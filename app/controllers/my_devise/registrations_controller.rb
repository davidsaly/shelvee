class MyDevise::RegistrationsController < Devise::RegistrationsController

	def new
		super do |resource|
			@token = params[:invitation_token]
		end
	end

	def create
		super do |resource|

			@token = params[:invitation_token]
			  if @token != nil
			     org =  Invitation.find_by_token(@token).album_id #find the user group attached to the invite
			     @album = Album.find_by_id(org)
			     @album.cooperations.create!(user: resource)
			     #@newUser.user_groups.push(org) #add this user to the new user group as a member
			  end
		end
	end

end 