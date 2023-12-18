class CoachesController < ApplicationController
  def index
    render status: :ok, json: { coaches: Coach.all }
  end
end
