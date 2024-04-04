# frozen_string_literal: true

module Parents
  # Controller responsible for handling confirmation actions for parents.
  class ConfirmationsController < Devise::ConfirmationsController
    # メールアドレスの承認
    # まだ導入を行っていないためルート未設定
    skip_before_action :login_status

    # GET /resource/confirmation/new
    # def new
    #   super
    # end

    # POST /resource/confirmation
    # def create
    #   super
    # end

    # GET /resource/confirmation?confirmation_token=abcdef
    # def show
    #   super
    # end

    # protected

    # The path used after resending confirmation instructions.
    # def after_resending_confirmation_instructions_path_for(resource_name)
    #   super(resource_name)
    # end

    # The path used after confirmation.
    # def after_confirmation_path_for(resource_name, resource)
    #   super(resource_name, resource)
    # end
  end
end
