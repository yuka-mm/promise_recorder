class PromiseCount < ApplicationRecord
  belongs_to :promise

  def self.promises_on(date)
    promises_for_day = where(date: date)
    completed = promises_for_day.where(completed: true).count
    [completed, promises_for_day.count]
  end
end
