class Week < ApplicationRecord
  has_many :weeklies, dependent: :destroy
  has_many :promises, through: :weeklies
end
