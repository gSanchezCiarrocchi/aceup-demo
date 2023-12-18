class Client < ApplicationRecord
  has_many :sessions
  has_many :coaches, through: :sessions

  validates :first_name, :last_name, :email, presence: true
  validates :email,                          uniqueness: true
end
