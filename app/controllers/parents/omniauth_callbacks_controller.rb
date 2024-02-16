# frozen_string_literal: true
class Parents::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    Rails.logger.debug "line method is called"
    Rails.logger.debug "LINE response: #{request.env['omniauth.auth'].inspect}"
    
    auth = request.env["omniauth.auth"]
    current_parent.uid = auth.uid
    current_parent.provider = auth.provider
    unless current_parent.save
      Rails.logger.error "Failed to save parent: #{current_parent.errors.full_messages.join(", ")}"
    end
  
    session["devise.line_data"] = request.env["omniauth.auth"].except(:extra)
    redirect_to welcome_path
  end
  
  def failure
    Rails.logger.debug "failure method is called"
    redirect_to parent_path # 認証に失敗した場合は、ルートパスにリダイレクト
  end

  def passthru
    Rails.logger.debug "passthru method is called"
    super
  end
end
