class Child < ApplicationRecord
  belongs_to :parent

  validates :name, length: { maximum: 15 }
end
