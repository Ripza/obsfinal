require 'test_helper'

class LocalizacionsControllerTest < ActionController::TestCase
  setup do
    @localizacion = localizacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:localizacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create localizacion" do
    assert_difference('Localizacion.count') do
      post :create, localizacion: { comuna: @localizacion.comuna, provincia: @localizacion.provincia, region: @localizacion.region }
    end

    assert_redirected_to localizacion_path(assigns(:localizacion))
  end

  test "should show localizacion" do
    get :show, id: @localizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @localizacion
    assert_response :success
  end

  test "should update localizacion" do
    put :update, id: @localizacion, localizacion: { comuna: @localizacion.comuna, provincia: @localizacion.provincia, region: @localizacion.region }
    assert_redirected_to localizacion_path(assigns(:localizacion))
  end

  test "should destroy localizacion" do
    assert_difference('Localizacion.count', -1) do
      delete :destroy, id: @localizacion
    end

    assert_redirected_to localizacions_path
  end
end
