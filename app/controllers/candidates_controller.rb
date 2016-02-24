class CandidatesController < ApplicationController
  def index
    render json: Candidate.all
  end

  def show
    render json: Candidate.first
  end

  def create
    Candidate.create!(name: params["name"], district: "Durham County", party: "Independent", hometown: "Durham")
  end
end
