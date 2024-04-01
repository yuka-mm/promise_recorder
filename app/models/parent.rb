# frozen_string_literal: true

# Parent represents the model for parents in the application.
class Parent < ApplicationRecord
  has_many :children, dependent: :destroy
  has_many :paydays, dependent: :destroy
  has_many :notices, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[line]

  validates :name, length: { maximum: 10 }
  validates :password, presence: true, on: :create

  enum role: { general: 0, admin: 1 }
end
