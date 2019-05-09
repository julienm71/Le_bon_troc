class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo, :first_name, :last_name, :phone, :ville, :pays, :cp, :adresse, :email, :password, :region, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :ville, :pays, :cp, :adresse, :email, :region, :password, :password_confirmation, :current_password])
  end
end
