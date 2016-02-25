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
    assert response.body.include?("1")
  end

  test "should get destroy" do
    delete :destroy, id: votes(:one).id, voter_id: voters(:one).id
    assert response.body.include?("Delete")
  end

end
