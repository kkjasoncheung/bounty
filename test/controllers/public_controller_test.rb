require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_index_url
    assert_response :success
  end

  test "should get profile" do
    get public_profile_url
    assert_response :success
  end

  test "should get messages_inbox" do
    get public_messages_inbox_url
    assert_response :success
  end

  test "should get requests_inbox" do
    get public_requests_inbox_url
    assert_response :success
  end

  test "should get send_request" do
    get public_send_request_url
    assert_response :success
  end

end
