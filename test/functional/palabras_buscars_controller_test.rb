require 'test_helper'

class PalabrasBuscarsControllerTest < ActionController::TestCase
  setup do
    @palabras_buscar = palabras_buscars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palabras_buscars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palabras_buscar" do
    assert_difference('PalabrasBuscar.count') do
      post :create, palabras_buscar: { palabra: @palabras_buscar.palabra }
    end

    assert_redirected_to palabras_buscar_path(assigns(:palabras_buscar))
  end

  test "should show palabras_buscar" do
    get :show, id: @palabras_buscar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palabras_buscar
    assert_response :success
  end

  test "should update palabras_buscar" do
    put :update, id: @palabras_buscar, palabras_buscar: { palabra: @palabras_buscar.palabra }
    assert_redirected_to palabras_buscar_path(assigns(:palabras_buscar))
  end

  test "should destroy palabras_buscar" do
    assert_difference('PalabrasBuscar.count', -1) do
      delete :destroy, id: @palabras_buscar
    end

    assert_redirected_to palabras_buscars_path
  end
end
