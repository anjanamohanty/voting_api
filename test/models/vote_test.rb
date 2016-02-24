require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "can create votes" do
    assert Vote.create!
  end

  test "votes belong to voters" do
    v = Voter.create!(name: "Anjana Mohanty", party: "Independent", token: "abc1234")
    vote = Vote.create!

    v.vote = vote
    v.save!

    assert_equal vote.voter_id, v.id
    assert_equal v.vote.id, vote.id
  end

  test "votes belong to candidates" do
    c = Candidate.create!(name: "Camden Carver", district: "Durham County", hometown: "Oxford", party: "Independent")
    vote = Vote.create!(voter_id: 3)
    vote_two = Vote.create!(voter_id: 4)

    c.votes << vote
    c.votes << vote_two

    assert_equal 2, c.votes.count
    assert_equal vote.candidate_id, c.id
  end

  test "votes belong to races" do
    r = Race.create!(name: "2016 Durham County")
    vote = Vote.create!(voter_id: 5)
    vote_two = Vote.create!(voter_id: 6)

    r.votes << vote
    r.votes << vote_two

    assert_equal 2, r.votes.count
    assert_equal vote.race_id, r.id
  end
end
