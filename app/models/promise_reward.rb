class PromiseReward < ApplicationRecord
  belongs_to :promise
  belongs_to :reward
end
