require 'securerandom'

class VotersController < ApplicationController
  def create
    v = Voter.create(name: params[:name], party: params[:party], token: SecureRandom.hex)
    render json: v
  end

  def show
    (render json: Voter.find(params[:id])) if (Voter.find(params[:id]).token == params[:token])
  end

  def update
    v = Voter.find(params[:id])
    if (v.token == params[:token])
      v.name = params[:name] || v.name
      v.party = params[:party] || v.party
      v.save
      render json: v
    end
  end
end
