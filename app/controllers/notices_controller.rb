class NoticesController < ApplicationController
  def index
    # 未読の通知を取得し、既読に更新する
    unread_notices = current_parent.notices.where(check: false)
    unread_notices.update_all(check: true)

    @parent = current_parent
    @notices = @parent.notices.order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy_all
    current_parent.notices.destroy_all
    redirect_to notices_path
  end
end
