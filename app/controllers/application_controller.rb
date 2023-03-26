class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def page_not_found
    render 'layouts/record_not_found', status: :not_found
  end

  def record_not_found
    render 'layouts/record_not_found', status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
