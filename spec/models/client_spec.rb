require 'rails_helper'

RSpec.describe Client, type: :model do
  subject { build :client }

  describe 'associations' do
    it { should have_many(:sessions) }
    it { should have_many(:coaches).through(:sessions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email) }
  end
end
