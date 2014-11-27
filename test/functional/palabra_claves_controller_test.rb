require 'test_helper'

class PalabraClavesControllerTest < ActionController::TestCase
  setup do
    @palabra_clafe = palabra_claves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palabra_claves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palabra_clafe" do
    assert_difference('PalabraClave.count') do
      post :create, palabra_clafe: { intension: @palabra_clafe.intension, palabra: @palabra_clafe.palabra }
    end

    assert_redirected_to palabra_clafe_path(assigns(:palabra_clafe))
  end

  test "should show palabra_clafe" do
    get :show, id: @palabra_clafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palabra_clafe
    assert_response :success
  end

  test "should update palabra_clafe" do
    put :update, id: @palabra_clafe, palabra_clafe: { intension: @palabra_clafe.intension, palabra: @palabra_clafe.palabra }
    assert_redirected_to palabra_clafe_path(assigns(:palabra_clafe))
  end

  test "should destroy palabra_clafe" do
    assert_difference('PalabraClave.count', -1) do
      delete :destroy, id: @palabra_clafe
    end

    assert_redirected_to palabra_claves_path
  end
end
