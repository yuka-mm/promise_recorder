class Promise < ApplicationRecord
  belongs_to :child
  belongs_to :reward

  validates :description, length: { maximum: 30 }
end
