class Count < ApplicationRecord
  belongs_to :promise
  after_save :update_child_points, if: :saved_change_to_completed?

  def self.remaining(child_id, date = Date.today)
    date = Date.parse(date.to_s) unless date.is_a? Date
    total_promises = self.joins(:promise).where(promises: { child_id: child_id }, start_time: date).count
    completed_promises = self.joins(:promise).where(promises: { child_id: child_id }, completed: true, start_time: date).count
    total_promises - completed_promises
  end

  def update_child_points
    point = promise.points || 1
  
    if completed
      # タスクが達成されたとき、Childのmonthly_pointsにポイントを加算
      promise.child.increment!(:monthly_points, point)
    else
      # タスクが未達成に戻されたとき、Childのmonthly_pointsからポイントを減算
      promise.child.decrement!(:monthly_points, point)
    end
  end
end
