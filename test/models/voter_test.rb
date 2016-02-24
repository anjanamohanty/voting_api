require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  test "can create voter" do
    assert Voter.create!(name: "Anjana Mohanty", party: "Independent", token: "abc1234")
  end

  test "voter has one and only one vote" do
    v = Voter.create!(name: "Anjana Mohanty", party: "Independent", token: "abc1234")
    vote = Vote.create!
    v.vote = vote

    assert_equal vote.voter_id, v.id
    refute Vote.create(voter_id: "#{v.id}").valid?
  end
end
