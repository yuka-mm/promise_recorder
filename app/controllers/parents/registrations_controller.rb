# frozen_string_literal: true

class Parents::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  skip_before_action :login_status
  

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  #アカウント登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    parent_path(resource)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # パスワードなしで名前を変更できるメソッド
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end

  # 編集後のリダイレクト先を指定するメソッド
  def after_update_path_for(resource)
    parent_path(resource)
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
