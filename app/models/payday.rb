# frozen_string_literal: true

# Payday represents the model for paydays in the application.
class Payday < ApplicationRecord
  belongs_to :parent
  belongs_to :child
end
