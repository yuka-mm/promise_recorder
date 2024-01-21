# frozen_string_literal: true

# ApplicationController is the base class for all controllers.
class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :login_status

  helper_method :calculate_age

  # Happybirthdayを使用して年齢を計算
  def calculate_age(birth_date)
    birthday = Happybirthday.born_on(birth_date.to_s)
    birthday.age.years_old
  end

  private
  
  def login_status
 #   unless devise_controller?
      if !parent_signed_in? && request.path != top_page_path
        redirect_to top_page_path
      end
  #  end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
