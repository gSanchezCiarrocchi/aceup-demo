require 'rails_helper'

describe FindCoach do
  subject(:context) { FindCoach.call coach_name: coach.name }

  let(:coach) { create :coach }

  describe ".call" do
    context "when coach exists" do
      before do
        allow(Coach).to receive(:find_by)
          .with({ name: coach.name })
          .and_return(coach)
      end

      it { expect(context).to be_a_success }

      it { expect(context.coach).to eq(coach) }
    end

    context "when coach does not exists" do
      before do
        allow(Coach).to receive(:find_by)
          .with({ name: coach.name })
          .and_return(nil)
      end

      it { expect(context).to be_a_failure }

      it { expect(context.message).to eq("Coach #{coach.name} does not exist") }
    end
  end
end
