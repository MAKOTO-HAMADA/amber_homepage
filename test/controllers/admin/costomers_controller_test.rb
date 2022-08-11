require "test_helper"

class Admin::CostomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_costomers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_costomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_costomers_edit_url
    assert_response :success
  end
end
