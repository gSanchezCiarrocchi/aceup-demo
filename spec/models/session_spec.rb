require 'rails_helper'

RSpec.describe Session, type: :model do
  subject { build :session, coach: build(:coach) }

  describe 'associations' do
    it { should belong_to(:client) }
    it { should belong_to(:coach) }
  end

  describe 'validations' do
    it do
      should validate_numericality_of(:duration)
        .only_integer
        .is_greater_than_or_equal_to(15)
    end

    describe 'session overlapping' do
      let(:coach) { create :coach }
      let(:time) { Date.new(2023, 5, 8).midday }

      context 'when session overlaps for coach' do
        before { create :session, start: time, duration: 60, coach: coach }
        subject { build :session, start: (time + 15.minutes), coach: coach }

        it { expect(subject).to be_invalid }
      end

      context 'when sessions do not overlap for coach' do
        before { create :session, start: time, duration: 60, coach: coach }
        subject { build :session, start: (time + 2.days), coach: coach }

        it { expect(subject).to be_valid }
      end
    end
  end
end
