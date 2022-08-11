require "test_helper"

class Admin::ContactGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_contact_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_contact_genres_edit_url
    assert_response :success
  end
end
