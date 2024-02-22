# frozen_string_literal: true

# ApplicationController is the base class for all controllers.
class ApplicationController < ActionController::Base
  before_action :login_status
  add_flash_types :success, :info, :warning, :danger
  helper_method :calculate_age

  # Happybirthdayを使用して年齢を計算
  def calculate_age(birth_date)
    birthday = Happybirthday.born_on(birth_date.to_s)
    birthday.age.years_old
  end

  def up
    render plain: 'OK'
  end

  private

  def login_status
    return unless !parent_signed_in? && request.path != top_page_path

    redirect_to top_page_path
  end
end
