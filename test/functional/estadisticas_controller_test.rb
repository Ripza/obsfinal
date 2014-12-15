require 'test_helper'

class EstadisticasControllerTest < ActionController::TestCase
  test "should get estadistica" do
    get :estadistica
    assert_response :success
  end

end
