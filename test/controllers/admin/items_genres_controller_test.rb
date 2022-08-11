require "test_helper"

class Admin::ItemsGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_items_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_items_genres_edit_url
    assert_response :success
  end
end
