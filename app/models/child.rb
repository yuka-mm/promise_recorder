# frozen_string_literal: true

# Child represents the model for children in the application.
class Child < ApplicationRecord
  belongs_to :parent

  validates :name, length: { maximum: 10 }
end
