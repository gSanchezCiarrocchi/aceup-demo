class Coach < ApplicationRecord
  has_many :sessions
  has_many :clients, through: :sessions

  validates :name, presence: true
  validates :hourly_rate_in_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
