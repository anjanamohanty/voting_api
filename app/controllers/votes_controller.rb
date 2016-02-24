class VotesController < ApplicationController
  def create
    voter = Voter.find(params[:voter_id])
    if voter.token == params[:token]
      v = Vote.create(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
      render json: v
    end
  end

  def index
    render json: Candidate.all
  end

  def destroy
    voter = Voter.find(params[:voter_id])
    v = Vote.find(params[:id])
    v.destroy! if (voter.token == params[:token])
    render json: "Deleted"
  end
end
