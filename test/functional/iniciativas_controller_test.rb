require 'test_helper'

class IniciativasControllerTest < ActionController::TestCase
  setup do
    @iniciativa = iniciativas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iniciativas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iniciativa" do
    assert_difference('Iniciativa.count') do
      post :create, iniciativa: { iniciativa_nombre: @iniciativa.iniciativa_nombre, iniciativa_tema: @iniciativa.iniciativa_tema }
    end

    assert_redirected_to iniciativa_path(assigns(:iniciativa))
  end

  test "should show iniciativa" do
    get :show, id: @iniciativa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iniciativa
    assert_response :success
  end

  test "should update iniciativa" do
    put :update, id: @iniciativa, iniciativa: { iniciativa_nombre: @iniciativa.iniciativa_nombre, iniciativa_tema: @iniciativa.iniciativa_tema }
    assert_redirected_to iniciativa_path(assigns(:iniciativa))
  end

  test "should destroy iniciativa" do
    assert_difference('Iniciativa.count', -1) do
      delete :destroy, id: @iniciativa
    end

    assert_redirected_to iniciativas_path
  end
end
