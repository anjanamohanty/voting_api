require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  test "can create races" do
    assert Race.create!(name: "2016 Durham County")
  end

  test "races have many votes" do
    v = Vote.create!(voter_id: 2)
    v_two = Vote.create!(voter_id: 3)
    r = Race.create!(name: "2016 Durham County")

    r.votes << v
    r.votes << v_two

    assert_equal 2, r.votes.count
    assert_equal v.race_id, r.id
  end

  test "races have many candidates" do
    c = Candidate.create!(name: "Camden Carver", district: "Durham County", hometown: "Oxford", party: "Independent")
    c_two = Candidate.create!(name: "Mike Hourigan", district: "Durham County", hometown: "Huntersville", party: "Democrat")
    r = Race.create!(name: "2016 Durham County")

    r.candidates << c
    r.candidates << c_two

    assert_equal 2, r.candidates.count
    assert_equal c.race_id, r.id
  end
end
