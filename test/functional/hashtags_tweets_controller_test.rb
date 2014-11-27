require 'test_helper'

class HashtagsTweetsControllerTest < ActionController::TestCase
  setup do
    @hashtags_tweet = hashtags_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hashtags_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hashtags_tweet" do
    assert_difference('HashtagsTweet.count') do
      post :create, hashtags_tweet: { hashtag_id: @hashtags_tweet.hashtag_id, tweet_id: @hashtags_tweet.tweet_id }
    end

    assert_redirected_to hashtags_tweet_path(assigns(:hashtags_tweet))
  end

  test "should show hashtags_tweet" do
    get :show, id: @hashtags_tweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hashtags_tweet
    assert_response :success
  end

  test "should update hashtags_tweet" do
    put :update, id: @hashtags_tweet, hashtags_tweet: { hashtag_id: @hashtags_tweet.hashtag_id, tweet_id: @hashtags_tweet.tweet_id }
    assert_redirected_to hashtags_tweet_path(assigns(:hashtags_tweet))
  end

  test "should destroy hashtags_tweet" do
    assert_difference('HashtagsTweet.count', -1) do
      delete :destroy, id: @hashtags_tweet
    end

    assert_redirected_to hashtags_tweets_path
  end
end
