class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :find_invitations

  #@inv = current_user.invites.where(accepted: false)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :invitation_token
  end

  def find_invitations
  	@inv = current_user.invites.where(accepted: false)
  end

end
