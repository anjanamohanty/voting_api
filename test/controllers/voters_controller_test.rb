require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "should get create" do
    assert_difference "Voter.count" do
      post :create, name: "Anjana", party: "Rep"
      assert_response :success
    end
  end

  test "should get show" do
    get :show, id: voters(:three).id, token: voters(:three).token
    assert response.body.include?("Kerry")
  end

  test "should get update" do
    v = Voter.create(name: "AJ", party: "Rep")
    put :update, id: v.id, token: v.token, name: "Jennifer"
    assert response.body.include?("Jennifer")
  end

  test "does not update with wrong token" do
    v = Voter.create(name: "AJ", party: "Rep")
    put :update, id: v.id, token: "123", name: "Jennifer"
    refute response.body.include?("Jennifer")
  end
end
