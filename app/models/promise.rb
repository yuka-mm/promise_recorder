class Promise < ApplicationRecord
  belongs_to :child
  has_many :promise_rewards
  has_many :rewards, through: :promise_rewards

  validates :description, length: { maximum: 30 }
  validates :description, presence: true

  enum day_of_week: { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6 }

  def start_time_weekday?
    Date::DAYNAMES.include?(start_time.to_s.capitalize)
  end
end
