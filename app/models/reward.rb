class Reward < ApplicationRecord
  belongs_to :child
  belongs_to :payday
  has_many :promise_rewards
  has_many :promises, through: :promise_rewards

  validate :reward_type_check

  private

  def reward_type_check
    if self.child.rewards.exists?
      last_reward = self.child.rewards.last
      if last_reward.pieces.present?
        errors.add(:base, "すでに個数制によるご褒美が追加されています。") unless self.pieces.present?
      elsif last_reward.pt_range.present?
        errors.add(:base, "すでにポイント範囲制によるご褒美が追加されています。") unless self.pt_range.present?
      elsif last_reward.pt_addition.present?
        errors.add(:base, "すでにポイント加算式によるご褒美が追加されています。") unless self.pt_addition.present?
      end
    end
  end
end
