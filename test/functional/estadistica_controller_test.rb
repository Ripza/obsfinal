require 'test_helper'

class EstadisticaControllerTest < ActionController::TestCase
  test "should get estadistica" do
    get :estadistica
    assert_response :success
  end

end
