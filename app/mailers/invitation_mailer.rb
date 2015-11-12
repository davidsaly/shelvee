class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invitation.subject
  #

  default from: "shelveeapp@gmail.com"

  def invitation
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def new_user_invitation(invitation, registration_path)

  	@registration_path = registration_path
  	mail(:to => invitation.recipient_email, :subject => "Album Invitation on Shelvee")

  end

end
