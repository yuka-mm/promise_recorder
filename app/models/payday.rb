# frozen_string_literal: true

# Payday represents the model for paydays in the application.
class Payday < ApplicationRecord
  belongs_to :parent
  belongs_to :child
  has_many :rewards, dependent: :destroy

  enum week: { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6 }
  enum action_type: { mail_type: 0, line_type: 1, not_set: 3 }

  after_initialize :set_default_action_type, if: :new_record?

  validate :date_or_week
  before_validation :check_month

  private

  def set_default_action_type
    self.action_type ||= :mail_type
  end

  def date_or_week
    puts "date: #{date}, week: #{week}, end_month: #{end_month}"
    return unless date.blank? && week.blank? && end_month == false

    errors.add(:base, '日付または曜日を選択してください')
  end

  def check_month
    self.date = nil if end_month == true
  end
end
