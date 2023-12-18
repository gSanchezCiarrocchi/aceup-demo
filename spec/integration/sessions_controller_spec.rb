require 'rails_helper'

RSpec.describe SessionsController do
  describe "POST create" do
    let(:coach) { create :coach }
    let(:coach_name) { coach.name }
    let(:client_email) { create(:client).email }
    let(:params) do
      {
        coach_name: coach.name,
        email: client_email,
        duration: 60,
        start_time: "2023-05-08 20:30"
      }
    end

    context 'when client exists' do
      context 'when session can be scheduled' do
        it 'schedules the session' do
          expect {
            post '/session', params: params
           }.to change { Session.count }.by(1)
        end

        it 'returns 200' do
          post '/session', params: params
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when session cannot be scheduled' do
        before do
          result = double :result
          allow(result).to receive(:success?).and_return(false)
          allow(result).to receive(:message).and_return("error")
          allow(ScheduleSessionOrganizer).to receive(:call).and_return(result)
        end

        it 'returns 422' do
          post '/session', params: params
          expect(response).to have_http_status(422)
        end
      end
    end

    context 'when client does not exists' do
      let(:client_email) { "fake@email.com" }

      it 'returns 422' do
        post '/session', params: params
        expect(response).to have_http_status(422)
      end
    end
  end
end
