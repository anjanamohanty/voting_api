require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get create" do
    post :create, voter_id: voters(:one).id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: votes(:one).id, voter_id: voters(:one).id
    assert_response :success
  end

end
