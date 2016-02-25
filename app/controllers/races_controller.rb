class RacesController < ApplicationController
  def index
    render json: Race.all
  end

  def show
  end
end
