require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test "can create candidates" do
    assert Candidate.create!(name: "Camden Carver", district: "Durham County", hometown: "Oxford", party: "Independent")
  end

  test "cannot create candidates with missing params" do
    refute Candidate.create(name: "Camden Carver").valid?
  end

  test "candidates have many votes" do
    v = Vote.create!(voter_id: 2)
    v_two = Vote.create!(voter_id: 3)
    c = Candidate.create(name: "Camden Carver", district: "Durham County", hometown: "Oxford", party: "Independent")

    c.votes << v
    c.votes << v_two

    assert_equal 2, c.votes.count
  end
end
