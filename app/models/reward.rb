# frozen_string_literal: true

class Reward < ApplicationRecord
  belongs_to :child
  belongs_to :payday

  validate :reward_type_check

  private

  def reward_type_check
    return unless child.rewards.exists?

    last_reward = child.rewards.last
    if last_reward.pieces.present?
      errors.add(:base, 'すでに個数制によるご褒美が追加されています。') unless pieces.present?
    elsif last_reward.pt_range.present?
      errors.add(:base, 'すでにポイント範囲制によるご褒美が追加されています。') unless pt_range.present?
    elsif last_reward.pt_addition.present?
      errors.add(:base, 'すでにポイント加算式によるご褒美が追加されています。') unless pt_addition.present?
    end
  end
end
