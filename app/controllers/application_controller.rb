class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password])
  end

  def after_sign_in_path_for(_resource)
    flash[:notice] = "Welcome, #{current_user.name}!"
    root_path
  end

  def after_sign_up_path_for(_resource)
    flash[:notice] = "Welcome, #{current_user.name}! Your account has been created."
    root_path
  end

  def after_sign_out_path_for(_resource)
    flash[:notice] = 'You have been logged out.'
    root_path
  end
end

