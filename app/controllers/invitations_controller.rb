class InvitationsController < ApplicationController
	before_action :set_album
	before_action :set_invitation, only: [:accept]


	def new
		@invitation = Invitation.new
	end

	def create
	
		@invitation = Invitation.new(invitation_params) # Make a new Invite
	   	@invitation.sender_id = current_user.id # set the sender to the current user
	   	#@invitation.accepted = false
	   	if @invitation.save
	   		if @invitation.recipient_id
	   			#send notification
	   			InvitationMailer.existing_user_invitation(@invitation, album_url(@invitation.album_id)).deliver_now
	   			
	   			#add to album
	   			#alb = Album.find_by_id(@invitation.album_id)
			    #alb.cooperations.create!(user_id: @invitation.recipient_id)
					   		
	   		else
	      		InvitationMailer.new_user_invitation(@invitation, new_user_registration_url(:invitation_token => @invitation.token)).deliver_now #send the invite data to our mailer to deliver the email
	   		end
	   		redirect_to album_path(invitation_params[:album_id])
	   	else
	      # oh no, creating an new invitation failed
	   	end

	end

	def accept
    	#add to album
	   	alb = Album.find_by_id(@invitation.album_id)
		alb.cooperations.create!(user_id: @invitation.recipient_id)
		@invitation.update_attribute(:accepted, true)
		redirect_to alb			
    end

	private

	def invitation_params
		params.require(:invitation).permit(:album_id, :recipient_email)
	end

	def set_invitation
		@invitation = Invitation.find params[:id]
	end

	def set_album
      #@album = current_user.albums.find params[:invitation[:album_id]]
    end

end
