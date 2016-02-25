require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get create" do
    v = Voter.create(name: "AJ", party: "Rep")
    assert_difference ("Vote.count") do
      post :create, voter_id: v.id, token: v.token
    end
  end

  test "should get index" do
    get :index
    assert response.body.include?("Bob")
  end

  test "should get destroy" do
    assert_difference "Vote.count", -1 do
      delete :destroy, id: votes(:one).id, voter_id: voters(:one).id, token: voters(:one).token
    end
  end
end
