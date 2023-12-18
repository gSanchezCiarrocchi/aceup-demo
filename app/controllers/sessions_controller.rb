class SessionsController < ApplicationController
  before_action :authenticate_client

  def create
    result = ScheduleSessionOrganizer.call session_interactor_params

    if result.success?
      render status: :ok, json: { message: "Session was scheduled!" }
    else
      render status: :unprocessable_entity, json: { message: result.message }
    end
  end

  private

  attr_reader :client

  def session_params
    params.permit :coach_name, :email, :start_time, :duration
  end

  def session_interactor_params
    {
      coach_name: session_params[:coach_name],
      client: client,
      start: session_params[:start_time],
      duration: session_params[:duration]
    }
  end

  def authenticate_client
    result = AuthenticateClient.call email: session_params[:email]
    render status: :unprocessable_entity, json: { message: result.message } if result.failure?

    @client = result.client
  end

end
