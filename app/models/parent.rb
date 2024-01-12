class Parent < ApplicationRecord
  has_many :child, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 15 }
end
