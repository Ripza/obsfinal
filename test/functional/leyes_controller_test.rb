require 'test_helper'

class LeyesControllerTest < ActionController::TestCase
  setup do
    @leye = leyes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leyes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leye" do
    assert_difference('Leye.count') do
      post :create, leye: { leyes_nombre: @leye.leyes_nombre, leyes_tema: @leye.leyes_tema }
    end

    assert_redirected_to leye_path(assigns(:leye))
  end

  test "should show leye" do
    get :show, id: @leye
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leye
    assert_response :success
  end

  test "should update leye" do
    put :update, id: @leye, leye: { leyes_nombre: @leye.leyes_nombre, leyes_tema: @leye.leyes_tema }
    assert_redirected_to leye_path(assigns(:leye))
  end

  test "should destroy leye" do
    assert_difference('Leye.count', -1) do
      delete :destroy, id: @leye
    end

    assert_redirected_to leyes_path
  end
end
