# frozen_string_literal: true

class ParentMailer < ApplicationMailer
  def achievement_notification(parent, child, message)
    @parent = parent
    @child = child
    @message = message
    mail(to: @parent.email, subject: 'Promise Recorder')
  end

  def change_email(parent, new_email, token)
    @parent = parent
    @new_email = new_email
    @token = token
    mail(to: @new_email, subject: 'メールアドレス変更確認')
  end
end
