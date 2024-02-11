class Count < ApplicationRecord
  belongs_to :promise

  def self.remaining(child_id, date = Date.today)
    date = Date.parse(date.to_s) unless date.is_a? Date
    total_promises = self.joins(:promise).where(promises: { child_id: child_id }, start_time: date).count
    completed_promises = self.joins(:promise).where(promises: { child_id: child_id }, completed: true, start_time: date).count
    total_promises - completed_promises
  end
end
