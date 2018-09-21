require 'test_helper'

class SocialMediaPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_media_post = social_media_posts(:one)
  end

  test "should get index" do
    get social_media_posts_url, as: :json
    assert_response :success
  end

  test "should create social_media_post" do
    assert_difference('SocialMediaPost.count') do
      post social_media_posts_url, params: { social_media_post: { social_media_id: @social_media_post.social_medium_id, text_content: @social_media_post.text_content, topic_id: @social_media_post.topic_id } }, as: :json
    end

    assert_response 201
  end

  test "should show social_media_post" do
    get social_media_post_url(@social_media_post), as: :json
    assert_response :success
  end

  test "should update social_media_post" do
    patch social_media_post_url(@social_media_post), params: { social_media_post: { social_medium_id: @social_media_post.social_media_id, text_content: @social_media_post.text_content, topic_id: @social_media_post.topic_id } }, as: :json
    assert_response 200
  end

  test "should destroy social_media_post" do
    assert_difference('SocialMediaPost.count', -1) do
      delete social_media_post_url(@social_media_post), as: :json
    end

    assert_response 204
  end
end
