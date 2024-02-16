class ParentMailer < ApplicationMailer
  def achievement_notification(parent, child, message)
    @parent = parent
    @child = child
    @message = message
    mail(to: @parent.email, subject: 'Promise Recorder')
  end
end
