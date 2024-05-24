# frozen_string_literal: true

class Promise < ApplicationRecord
  belongs_to :child
  has_many :counts, dependent: :destroy
  has_many :weeklies, dependent: :destroy
  has_many :weeks, through: :weeklies

  attr_accessor :select_type, :week_ids

  validates :description, length: { maximum: 30 }
  validates :description, presence: true
  validate :week_ids_selected, on: %i[create update], if: -> { select_type == '曜日を指定して登録する' }

  before_update :reset_start_day_or_weeks
  after_create :create_promise_counts
  after_update :recreate_promise_counts

  def week_ids=(ids)
    Rails.logger.debug "Setting week_ids to: #{ids.inspect}"
    @week_ids = ids
    loaded_weeks = Week.where(id: ids)
    Rails.logger.debug "Loaded weeks: #{loaded_weeks.inspect}"
    self.weeks = loaded_weeks
    Rails.logger.debug "After assignment, weeks: #{weeks.inspect}"
  end

  private

  def week_ids_selected
    return unless weeks.blank?

    errors.add(:base, '曜日を選択してください')
  end

  def reset_start_day_or_weeks
    if select_type == '曜日を指定して登録する'
      self.start_day = nil
      self.monthly_flag = false if monthly_flag
    elsif select_type == '日付を指定して登録する'
      weeklies.destroy_all
    end
  end

  def create_promise_counts
    if !monthly_flag
      create_monthly_flag_false
    else
      create_monthly_flag_true
    end
  end

  def recreate_promise_counts
    Count.where(promise_id: id).destroy_all

    if !monthly_flag
      create_monthly_flag_false
    else
      create_monthly_flag_true
    end
  end

  def create_monthly_flag_false
    # monthly_flagが選択されていない場合
    if start_day.present?
      # start_dayが存在する場合、その日付を使用
      Count.create!(
        promise_id: id,
        start_time: start_day,
        completed: false
      )
    else
      weeklies.each do |weekly|
        week_id = weekly.week_id
        day_of_week_number = week_id % 7 # week_idを使って曜日の数字を計算（1:月曜日〜7:日曜日）

        date = if Date.today.wday == day_of_week_number
                 # 今日がその曜日である場合、今日の日付を使用
                 Date.today
               else
                 # そうでない場合、次のその曜日の日付を計算
                 Date.today + ((day_of_week_number - Date.today.wday + 7) % 7).days
               end

        # 指定した日付から4週間後（28日後）まで、毎週その曜日のPromiseRewardを作成
        (date..date + 28.days).step(7) do |m_date|
          Count.create!(
            promise_id: id,
            start_time: m_date,
            completed: false
          )
        end
      end
    end
  end

  def create_monthly_flag_true
    # monthly_flagが選択されている場合
    (start_day.to_date..(start_day.to_date + 30.days)).each do |f_date|
      Count.create!(
        promise_id: id,
        start_time: f_date,
        completed: false
      )
    end
  end
end
