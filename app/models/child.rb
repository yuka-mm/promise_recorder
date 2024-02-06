# frozen_string_literal: true

# Child represents the model for children in the application.
class Child < ApplicationRecord
  belongs_to :parent
  has_one :payday, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :promises, dependent: :destroy

  validates :name, length: { maximum: 10 }
end
