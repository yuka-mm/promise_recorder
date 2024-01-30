class Reward < ApplicationRecord
  belongs_to :child
  belongs_to :payday
end
