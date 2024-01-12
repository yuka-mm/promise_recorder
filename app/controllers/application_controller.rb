# frozen_string_literal: true

# ApplicationController is the base class for all controllers.
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :login_status

  private
  
  def login_status
    unless devise_controller?
      if !parent_signed_in? && request.path != top_page_path
        redirect_to top_page_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
