require 'test_helper'

class PalabrasClavesControllerTest < ActionController::TestCase
  setup do
    @palabras_clafe = palabras_claves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palabras_claves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palabras_clafe" do
    assert_difference('PalabrasClave.count') do
      post :create, palabras_clafe: { intension: @palabras_clafe.intension, palabra: @palabras_clafe.palabra }
    end

    assert_redirected_to palabras_clafe_path(assigns(:palabras_clafe))
  end

  test "should show palabras_clafe" do
    get :show, id: @palabras_clafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palabras_clafe
    assert_response :success
  end

  test "should update palabras_clafe" do
    put :update, id: @palabras_clafe, palabras_clafe: { intension: @palabras_clafe.intension, palabra: @palabras_clafe.palabra }
    assert_redirected_to palabras_clafe_path(assigns(:palabras_clafe))
  end

  test "should destroy palabras_clafe" do
    assert_difference('PalabrasClave.count', -1) do
      delete :destroy, id: @palabras_clafe
    end

    assert_redirected_to palabras_claves_path
  end
end
