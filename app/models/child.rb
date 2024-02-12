# frozen_string_literal: true

# Child represents the model for children in the application.
class Child < ApplicationRecord
  belongs_to :parent
  has_one :payday, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :promises, dependent: :destroy
  has_many :counts, through: :promises

  validates :name, length: { maximum: 10 }

  after_destroy :destroy_counts

  private

  def destroy_counts
    self.promises.destroy_all
  end
end
