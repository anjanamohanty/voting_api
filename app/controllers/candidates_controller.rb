class CandidatesController < ApplicationController
  def index
    render json: Candidate.all
  end

  def show
    render json: Candidate.find(params[:id])
  end

  def create
    c = Candidate.create(name: params["name"], district: "Durham County", party: "Independent", hometown: "Durham")
    render json: c
  end
end
