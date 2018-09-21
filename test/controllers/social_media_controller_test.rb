require 'test_helper'

class SocialMediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_medium = social_media(:one)
  end

  test "should get index" do
    get social_media_url, as: :json
    assert_response :success
  end

  test "should create social_medium" do
    assert_difference('SocialMedium.count') do
      post social_media_url, params: { social_medium: { name: @social_medium.name } }, as: :json
    end

    assert_response 201
  end

  test "should show social_medium" do
    get social_medium_url(@social_medium), as: :json
    assert_response :success
  end

  test "should update social_medium" do
    patch social_medium_url(@social_medium), params: { social_medium: { name: @social_medium.name } }, as: :json
    assert_response 200
  end

  test "should destroy social_medium" do
    assert_difference('SocialMedium.count', -1) do
      delete social_medium_url(@social_medium), as: :json
    end

    assert_response 204
  end
end
