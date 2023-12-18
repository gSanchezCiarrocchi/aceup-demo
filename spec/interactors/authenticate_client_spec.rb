require 'rails_helper'

describe AuthenticateClient do
  subject(:context) { AuthenticateClient.call email: client.email }

  let(:client) { create :client }

  describe ".call" do
    context "when client is valid" do
      before do
        allow(Client).to receive(:find_by)
          .with({ email: client.email })
          .and_return(client)
      end

      it { expect(context).to be_a_success }

      it { expect(context.client).to eq(client) }
    end

    context "when client is invalid " do
      before do
        allow(Client).to receive(:find_by)
          .with({ email: client.email })
          .and_return(nil)
      end

      it { expect(context).to be_a_failure }

      it { expect(context.message).to eq("Client is not registered") }
    end
  end
end
