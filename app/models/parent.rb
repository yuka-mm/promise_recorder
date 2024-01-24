# frozen_string_literal: true

# Parent represents the model for parents in the application.
class Parent < ApplicationRecord
  has_many :children, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 10 }
  validates :password, presence: true, on: :create
end
