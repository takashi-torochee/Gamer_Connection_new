require "test_helper"

class Public::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follows" do
    get public_relationships_follows_url
    assert_response :success
  end

  test "should get followers" do
    get public_relationships_followers_url
    assert_response :success
  end
end
