# frozen_string_literal: true

class Week < ApplicationRecord
  has_many :weeklies, dependent: :destroy
  has_many :promises, through: :weeklies
end
