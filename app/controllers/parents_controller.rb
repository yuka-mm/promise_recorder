# frozen_string_literal: true

# ParentsController is responsible for managing parent resources.
class ParentsController < ApplicationController
  before_action :authenticate_parent!, only: %i[edit_email update_email confirm_email]
  before_action :ensure_logged_out, only: %i[create_reset]

  def show
    @current_parent = current_parent
    @parent_children = @current_parent.children
  end

  # メールアドレスの変更
  def edit_email
    @parent = current_parent
  end

  def update_email
    new_email = params[:parent][:email]

    # メールアドレスのフォーマット検証
    if new_email.blank? || !(new_email =~ URI::MailTo::EMAIL_REGEXP)
      flash[:alert] = "有効なメールアドレスを入力してください。"
      render :edit_email
      return
    end

    # トークン生成とデータベースへの保存
    token = SecureRandom.hex(10)
    if current_parent.update(unconfirmed_email: new_email, email_confirmation_token: token)
      ParentMailer.change_email(current_parent, new_email, token).deliver_now
  
      flash[:notice] = "#{new_email} に確認メールを送信しました。メール内のリンクからメールアドレスの変更を完了してください。"
      redirect_to root_path
    else
      logger.debug "Update failed: #{current_parent.errors.full_messages}"
      flash[:alert] = "メールアドレスの変更に失敗しました。"
      render :edit_email
    end
  end

  # メールのリンクからアクセスされたときのメールアドレスの変更を確定
  def confirm_email
    token = params[:token]
    parent = Parent.find_by(email_confirmation_token: token)
  
    if parent && token.present? && parent.unconfirmed_email.present?
      # トークンと一時保存されたメールアドレスを使用してユーザーを検証
      parent.update(email: parent.unconfirmed_email, unconfirmed_email: nil, email_confirmation_token: nil)
      flash[:notice] = "メールアドレスが変更されました。"
      redirect_to parent_path(parent)
    else
      # トークンが無効、または一時保存されたメールアドレスが存在しない場合
      flash[:alert] = "メールアドレスの変更リンクが無効、または期限切れです。"
      redirect_to root_path
    end
  end

  # パスワード変更
  def password_edit
    @parent = current_parent
  end

  def create_reset
    parent = Parent.find_by(email: params[:parent][:email])
    if parent
      parent.send_reset_password_instructions
      redirect_to new_parent_session_path, notice: 'パスワードリセット用のメールを送信しました。'
    else
      flash.now[:alert] = 'メールアドレスが見つかりませんでした。'
      render :edit_password
    end
  end

  private

  def ensure_logged_out
    sign_out(current_parent) if parent_signed_in?
  end
end
