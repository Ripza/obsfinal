require 'test_helper'

class TweetsPalClavesControllerTest < ActionController::TestCase
  setup do
    @tweets_pal_clafe = tweets_pal_claves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets_pal_claves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweets_pal_clafe" do
    assert_difference('TweetsPalClafe.count') do
      post :create, tweets_pal_clafe: { palabra_clave_id: @tweets_pal_clafe.palabra_clave_id, tweet_id: @tweets_pal_clafe.tweet_id }
    end

    assert_redirected_to tweets_pal_clafe_path(assigns(:tweets_pal_clafe))
  end

  test "should show tweets_pal_clafe" do
    get :show, id: @tweets_pal_clafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweets_pal_clafe
    assert_response :success
  end

  test "should update tweets_pal_clafe" do
    put :update, id: @tweets_pal_clafe, tweets_pal_clafe: { palabra_clave_id: @tweets_pal_clafe.palabra_clave_id, tweet_id: @tweets_pal_clafe.tweet_id }
    assert_redirected_to tweets_pal_clafe_path(assigns(:tweets_pal_clafe))
  end

  test "should destroy tweets_pal_clafe" do
    assert_difference('TweetsPalClafe.count', -1) do
      delete :destroy, id: @tweets_pal_clafe
    end

    assert_redirected_to tweets_pal_claves_path
  end
end
