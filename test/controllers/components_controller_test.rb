require "test_helper"

class ComponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get components_create_url
    assert_response :success
  end

  test "should get update" do
    get components_update_url
    assert_response :success
  end

  test "should get destroy" do
    get components_destroy_url
    assert_response :success
  end
end
