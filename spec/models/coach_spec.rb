require 'rails_helper'

RSpec.describe Coach, type: :model do
  it { should have_many(:sessions) }
  it { should have_many(:clients).through(:sessions) }

  it { should validate_presence_of(:name) }
  it do
    should validate_numericality_of(:hourly_rate_in_cents)
      .only_integer
      .is_greater_than_or_equal_to(0)
  end
end
