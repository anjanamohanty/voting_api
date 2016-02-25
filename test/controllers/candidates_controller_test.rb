require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert response.body.include?("Bob")
    assert response.body.include?("votes")
  end

  test "should get show" do
    get :show, id: candidates(:one).id
    assert response.body.include?("Bob")
    refute response.body.include?("George")
  end

  test "should get create" do
    assert_difference "Candidate.count" do
      post :create, name: "Perot", party: "Rep", hometown: "DC", district: "DC"
      assert_response :success
    end
  end
end
