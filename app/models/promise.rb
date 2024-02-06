class Promise < ApplicationRecord
  belongs_to :child
  has_many :promise_counts, dependent: :destroy

  validates :description, length: { maximum: 30 }
  validates :description, presence: true
  validate :either_day_of_week_or_start_day


  enum day_of_week: { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6 }

  after_save :create_or_update_promise_counts

  private

  def either_day_of_week_or_start_day
    if [day_of_week, start_day].count(&:present?) != 1
      errors.add(:base, "Either day_of_week or start_day must be present")
    end
  end

  def create_or_update_promise_counts
    if !monthly_flag
      monthly_flag_false
    else
      monthly_flag_true
    end
  end

  def monthly_flag_false
    # monthly_flagが選択されていない場合
    if day_of_week.present?
      day_of_week_number = day_of_week.to_i
      # day_of_weekが存在する場合、その曜日に基づくPromiseRewardを作成
      if Date.today.wday == day_of_week_number
        # 今日がその曜日である場合、今日の日付を使用
        date = Date.today
      else
        # そうでない場合、次のその曜日の日付を計算
        date = Date.today + ((day_of_week_number - Date.today.wday + 7) % 7).days
      end
      # 指定した日付から4週間後（28日後）まで、毎週その曜日のPromiseRewardを作成
      (date..date + 28.days).step(7) do |date|
        PromiseCount.create!(
          promise_id: self.id,
          start_time: date,
          completed: false
        )
      end
    elsif start_day.present?
      # start_dayが存在する場合、その日付を使用
      PromiseCount.create!(
        promise_id: self.id,
        start_time: start_day,
        completed: false
      )
    end
  end

  def monthly_flag_true
    # monthly_flagが選択されている場合
    (self.start_day.to_date..(self.start_day.to_date + 30.days)).each do |date|
      PromiseCount.create!(
        promise_id: self.id,
        start_time: date,
        completed: false
      )
    end
  end
end
