# frozen_string_literal: true

class Weekly < ApplicationRecord
  belongs_to :promise
  belongs_to :week
end
