# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :parent
end
